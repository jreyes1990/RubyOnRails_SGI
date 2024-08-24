class PermisoDocumentoUsuariosController < ApplicationController
  before_action :set_permiso_documento_usuario, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /permiso_documento_usuarios or /permiso_documento_usuarios.json
  def index
    @listado_usuarios = PermisoDocumentoUsuario
                        .select("users.email, (personas.nombre||' '||personas.apellido||', ('||users.email||')') as nombre_completo")
                        .joins(user: :persona)
                        .where(estado: 'A')
                        .distinct

    @q = PermisoDocumentoUsuario.joins(user: :persona).ransack(params[:q])

    @permiso_documento_usuarios = @q.result(distinct: true)

    @permiso_documento_usuario_encabezado = PermisoDocumentoUsuario
                                            .select("user_id")
                                            .distinct
                                            .ransack(params[:q])
                                            .result(distinct: true)
                                            .paginate(page: params[:page], per_page: 5)

    @usuario_permiso_documento_id = params[:usuario_permiso_documento_id]  

    respond_to do |format|    
      format.html
      format.json { render json: PermisoDocumentoUsuarioDatatable.new(params, view_context: view_context, usuario_permiso_documento_id: @usuario_permiso_documento_id) }
    end
  end

  def download_excel_formats
    @titulo_formato_excel = "PERMISO DOCUMENTO USUARIO"

    @modulo_permiso_usuario = PermisoDocumentoUsuario.select("PERMISO_DOCUMENTO_USUARIOS.*,
                                                              (CASE WHEN PERMISO_DOCUMENTO_USUARIOS.ESTADO ='A' THEN 'ACTIVO' WHEN PERMISO_DOCUMENTO_USUARIOS.ESTADO ='I' THEN 'INACTIVO' ELSE '' END) AS ESTADO_PERMISO,
                                                              PERMISO_DOCUMENTOS.TIPO_USUARIO_ID, PERMISO_DOCUMENTOS.TIPO_SISTEMA_ID, PERMISO_DOCUMENTOS.PROCESO_ID,PERMISO_DOCUMENTOS.TIPO_DOCUMENTO_ID, PERMISO_DOCUMENTOS.DOCUMENTO_ID,
                                                              TIPO_USUARIOS.NOMBRE AS NOMBRE_CLASIFICA_DOCUMENTO, TIPO_SISTEMAS.NOMBRE AS NOMBRE_TIPO_SISTEMA, PROCESOS.NOMBRE AS NOMBRE_PROCESO, PROCESOS.MACRO_PROCESO_ID, PROCESOS.TIPO_PROCESO_ID, MACRO_PROCESOS.NOMBRE AS NOMBRE_MACRO_PROCESO, TIPO_DOCUMENTOS.NOMBRE AS NOMBRE_TIPO_DOCUMENTO, TIPO_PROCESOS.NOMBRE AS NOMBRE_TIPO_PROCESO,
                                                              TIPO_DOCUMENTOS.NOMBRE AS NOMBRE_TIPO_DOCUMENTO, (DOCUMENTOS.CODIGO||LPAD(DOCUMENTOS.CORRELATIVO,3,'0')) AS CODIGO_DOCUMENTO, DOCUMENTOS.NOMBRE AS NOMBRE_DOCUMENTO, DOCUMENTOS.FECHA_VIGENCIA, DOCUMENTOS.VERSION,
                                                              USERS.EMAIL, (PERSONAS.NOMBRE||' '||PERSONAS.APELLIDO) AS NOMBRE_USUARIO")
                                                      .joins("INNER JOIN PERMISO_DOCUMENTOS ON(PERMISO_DOCUMENTO_USUARIOS.PERMISO_DOCUMENTO_ID=PERMISO_DOCUMENTOS.ID)
                                                              INNER JOIN TIPO_USUARIOS ON(PERMISO_DOCUMENTOS.TIPO_USUARIO_ID=TIPO_USUARIOS.ID)
                                                              INNER JOIN TIPO_SISTEMAS ON(PERMISO_DOCUMENTOS.TIPO_SISTEMA_ID=TIPO_SISTEMAS.ID)
                                                              INNER JOIN PROCESOS ON(PERMISO_DOCUMENTOS.PROCESO_ID=PROCESOS.ID)
                                                              INNER JOIN TIPO_DOCUMENTOS ON(PERMISO_DOCUMENTOS.TIPO_DOCUMENTO_ID=TIPO_DOCUMENTOS.ID)
                                                              INNER JOIN DOCUMENTOS ON(PERMISO_DOCUMENTOS.DOCUMENTO_ID=DOCUMENTOS.ID)
                                                              INNER JOIN MACRO_PROCESOS ON(PROCESOS.MACRO_PROCESO_ID=MACRO_PROCESOS.ID)
                                                              INNER JOIN TIPO_PROCESOS  ON(PROCESOS.TIPO_PROCESO_ID=TIPO_PROCESOS.ID)
                                                              INNER JOIN USERS ON(PERMISO_DOCUMENTO_USUARIOS.USER_ID=USERS.ID)
                                                              INNER JOIN PERSONAS ON(USERS.ID=PERSONAS.USER_ID)")
                                                      .order("NOMBRE_USUARIO, NOMBRE_CLASIFICA_DOCUMENTO, NOMBRE_TIPO_SISTEMA")

    @nombre_columnas = []    
    @ids_columnas = []

    @nombre_columnas.push("USUARIO")
    @nombre_columnas.push("EMAIL")
    @nombre_columnas.push("CLASIFICACIÓN DOCUMENTO")    
    @nombre_columnas.push("SISTEMA")
    @nombre_columnas.push("PROCESO")
    @nombre_columnas.push("TIPO_DOCUMENTO")
    @nombre_columnas.push("DOCUMENTO")
    @nombre_columnas.push("ESTADO")
    @nombre_columnas.push("FECHA CREACIÓN DE PERMISOS")
    
    @ids_columnas.push("NU")
    @ids_columnas.push("EU")
    @ids_columnas.push("CD")
    @ids_columnas.push("NTS")
    @ids_columnas.push("NP")
    @ids_columnas.push("NTD")
    @ids_columnas.push("ND")
    @ids_columnas.push("EP")
    @ids_columnas.push("CP")
   
    render xlsx: 'formato-pdu-sgi', 
           template: 'permiso_documento_usuarios/template_excel_download.xlsx.axlsx'
  end 

  def search_usuarios_perm_doctos
    usuario_id = params[:usuario_id_param]

    if usuario_id.to_i > 0
      @tipo_usuario = PermisoDocumento.where("tipo_usuario_id=? and estado=?", usuario_id, 'A').order("id DESC")
      
      respond_to do |format|
        format.json { render json: @tipo_usuario.map { |e| { permiso_id: e.id, descripcion: e.desc_permiso_docto } } }
      end
    else
      respond_to do |format|
        format.json { render json: [] }
      end
    end
  end

  def search_usuario_sistema
    usuario_id = params[:usuario_id_param]

    if usuario_id.to_i > 0
      @sistema = TipoSistema.select("permiso_documentos.tipo_usuario_id, permiso_documentos.tipo_sistema_id, tipo_sistemas.nombre")
                            .joins("inner join permiso_documentos on(tipo_sistemas.id=permiso_documentos.tipo_sistema_id)")
                            .where("permiso_documentos.tipo_usuario_id=? and permiso_documentos.estado=?",usuario_id, 'A')
                            .distinct
      
      respond_to do |format|
        format.json { render json: @sistema.map { |e| { permiso_id: "#{e.tipo_usuario_id}|#{e.tipo_sistema_id}", descripcion: e.nombre } } }
      end
    else
      respond_to do |format|
        format.json { render json: [] }
      end
    end
  end

  def search_sistema_perm_doctos
    @sistema_id = params[:sistema_id_param]

    @array_sistema = Array.new

    @sistema_id.each do |k|
      key_sistema_split = k.split("|")
      @codigo_usuario = key_sistema_split[0].to_i
      @array_sistema.push(key_sistema_split[1])
    end
    codigo_sistema = @array_sistema.to_a
    
    if @codigo_usuario != '0' && codigo_sistema != '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and tipo_sistema_id in(?) and estado=?",@codigo_usuario,codigo_sistema,'A').order("id DESC")
    elsif @codigo_usuario != '0' && codigo_sistema == '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and estado=?",@codigo_usuario,'A').order("id DESC")
    else
      @permiso_usuario = PermisoDocumento.where("estado=?",'A').order("id DESC")
    end
    
    respond_to do |format|
      format.json { render json: @permiso_usuario.map { |e| { permiso_id: e.id, descripcion: e.desc_permiso_docto } } }
    end  
  end

  def search_sistema_proceso
    @sistema_id = params[:sistema_id_param]
    
    @array_sistema = Array.new

    @sistema_id.each do |k|
      key_sistema_split = k.split("|")
      @codigo_usuario = key_sistema_split[0].to_i
      @array_sistema.push(key_sistema_split[1])
    end
    codigo_sistema = @array_sistema.to_a
    
    if @codigo_usuario != '0' && codigo_sistema != '0'
      @proceso = Proceso.joins("inner join permiso_documentos on(procesos.id=permiso_documentos.proceso_id)")
                        .where("permiso_documentos.tipo_usuario_id=? and permiso_documentos.tipo_sistema_id in(?) and permiso_documentos.estado=?",@codigo_usuario,codigo_sistema,'A')
                        .distinct
      
    elsif @codigo_usuario != '0' && codigo_sistema == '0'
      @proceso = Proceso.joins("inner join permiso_documentos on(procesos.id=permiso_documentos.proceso_id)")
                        .where("permiso_documentos.tipo_usuario_id=? and permiso_documentos.estado=?",@codigo_usuario,'A')
                        .distinct
    else
      @proceso = Proceso.joins("inner join permiso_documentos on(procesos.id=permiso_documentos.proceso_id)")
                        .where("permiso_documentos.estado=?",'A')
                        .distinct
    end
    
    respond_to do |format|
      format.json { render json: @proceso.map { |e| { codigo_proceso: "#{@codigo_usuario}|#{codigo_sistema.join(",")}|#{e.id}", nombre_proceso: e.nombre } } }
    end 
  end

  def search_proceso_perm_doctos
    @proceso_id = params[:proceso_id_param]
    
    @array_proceso = Array.new

    @proceso_id.each do |p|
      key_proceso_split = p.split("|")
      @codigo_usuario = key_proceso_split[0].to_i
      @id_sistema = key_proceso_split[1].split(",")
      @array_proceso.push(key_proceso_split[2])
    end
    codigo_sistema = @id_sistema
    codigo_proceso = @array_proceso

    if @codigo_usuario != '0' && codigo_sistema != '0' && codigo_proceso != '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and tipo_sistema_id in(?) and proceso_id in(?) and estado=?",@codigo_usuario,codigo_sistema,codigo_proceso,'A').order("id DESC")
    elsif @codigo_usuario != '0' && codigo_sistema != '0' && codigo_proceso == '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and tipo_sistema_id in(?) and estado=?",@codigo_usuario,codigo_sistema,'A').order("id DESC")
    elsif @codigo_usuario != '0' && codigo_sistema == '0' && codigo_proceso == '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and estado=?",@codigo_usuario,'A').order("id DESC")
    else
      @permiso_usuario = PermisoDocumento.where("estado=?",'A').order("id DESC")
    end

    respond_to do |format|
      format.json { render json: @permiso_usuario.map { |e| { permiso_id: e.id, descripcion: e.desc_permiso_docto } } }
    end 
  end

  def search_proceso_tipo_documento
    @proceso_id = params[:proceso_id_param]

    @array_proceso = Array.new

    @proceso_id.each do |p|
      key_proceso_split = p.split("|")
      @codigo_usuario = key_proceso_split[0].to_i
      @id_sistema = key_proceso_split[1].split(",")
      @array_proceso.push(key_proceso_split[2])
    end
    codigo_sistema = @id_sistema
    codigo_proceso = @array_proceso

    if @codigo_usuario != '0' && codigo_sistema != '0' && codigo_proceso != '0'
      @tipo_documento = TipoDocumento.joins("inner join permiso_documentos on(tipo_documentos.id=permiso_documentos.tipo_documento_id)")
                                     .where("permiso_documentos.tipo_usuario_id=? and permiso_documentos.tipo_sistema_id in(?) and permiso_documentos.proceso_id in(?) and permiso_documentos.estado=?",@codigo_usuario,codigo_sistema,codigo_proceso,'A')
                                     .distinct
    elsif @codigo_usuario != '0' && codigo_sistema != '0' && codigo_proceso == '0'
      @tipo_documento = TipoDocumento.joins("inner join permiso_documentos on(tipo_documentos.id=permiso_documentos.tipo_documento_id)")
                                     .where("permiso_documentos.tipo_usuario_id=? and permiso_documentos.tipo_sistema_id in(?) and permiso_documentos.estado=?",@codigo_usuario,codigo_sistema,'A')
                                     .distinct
    elsif @codigo_usuario != '0' && codigo_sistema == '0' && codigo_proceso == '0'
      @tipo_documento = TipoDocumento.joins("inner join permiso_documentos on(tipo_documentos.id=permiso_documentos.tipo_documento_id)")
                                     .where("permiso_documentos.tipo_usuario_id=? and permiso_documentos.estado=?",@codigo_usuario,'A')
                                     .distinct
    else
      @tipo_documento = TipoDocumento.joins("inner join permiso_documentos on(tipo_documentos.id=permiso_documentos.tipo_documento_id)")
                                      .where("permiso_documentos.estado=?",'A')
                                     .distinct
    end

    respond_to do |format|
      format.json { render json: @tipo_documento.map { |e| { codigo_tipo_documento: "#{@codigo_usuario}|#{codigo_sistema.join(",")}|#{codigo_proceso.join(",")}|#{e.id}", nombre_tipo_documento: e.nombre } } }
    end 
  end

  def search_tipo_documento_perm_doctos
    @tipo_docto_id = params[:tipo_docto_id_param]

    @array_tipo_docto = Array.new

    @tipo_docto_id.each do |td|
      key_tipo_docto_split = td.split("|")
      @codigo_usuario = key_tipo_docto_split[0].to_i
      @id_sistema = key_tipo_docto_split[1].split(",")
      @id_proceso = key_tipo_docto_split[2].split(",")
      @array_tipo_docto.push(key_tipo_docto_split[3])
    end
    codigo_sistema = @id_sistema
    codigo_proceso = @id_proceso
    codigo_tipo_docto = @array_tipo_docto

    if @codigo_usuario != '0' && codigo_sistema != '0' && codigo_proceso != '0' && codigo_tipo_docto != '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and tipo_sistema_id in(?) and proceso_id in(?) and tipo_documento_id in(?) and estado=?",@codigo_usuario,codigo_sistema,codigo_proceso,codigo_tipo_docto,'A').order("id DESC")
    elsif @codigo_usuario != '0' && codigo_sistema != '0' && codigo_proceso != '0' && codigo_tipo_docto != '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and tipo_sistema_id in(?) and proceso_id in(?) and estado=?",@codigo_usuario,codigo_sistema,codigo_proceso,'A').order("id DESC")
    elsif @codigo_usuario != '0' && codigo_sistema != '0' && codigo_proceso == '0' && codigo_tipo_docto != '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and tipo_sistema_id in(?) and estado=?",@codigo_usuario,codigo_sistema,'A').order("id DESC")
    elsif @codigo_usuario != '0' && codigo_sistema == '0' && codigo_proceso == '0' && codigo_tipo_docto == '0'
      @permiso_usuario = PermisoDocumento.where("tipo_usuario_id=? and estado=?",@codigo_usuario,'A').order("id DESC")
    else
      @permiso_usuario = PermisoDocumento.where("estado=?",'A').order("id DESC")
    end

    respond_to do |format|
      format.json { render json: @permiso_usuario.map { |e| { permiso_id: e.id, descripcion: e.desc_permiso_docto } } }
    end 
  end

  # GET /permiso_documento_usuarios/1 or /permiso_documento_usuarios/1.json
  def show
  end

  # GET /permiso_documento_usuarios/new
  def new
    @permiso_documento_usuario = PermisoDocumentoUsuario.new
  end

  # GET /permiso_documento_usuarios/1/edit
  def edit
  end

  # POST /permiso_documento_usuarios or /permiso_documento_usuarios.json
  def create
    usuario_ids = params[:permiso_documento_usuario][:user_id]
    permiso_ids = params[:permiso_documento_usuario][:permiso_documento_id]

    usuario_ids.each do |u|
      permiso_ids.each do |p|
        @consulta_permiso_usuario = PermisoDocumentoUsuario.where(user_id: u, permiso_documento_id: p)

        if @consulta_permiso_usuario.blank?
          @permiso_documento_usuario = PermisoDocumentoUsuario.new
          @permiso_documento_usuario.user_id = u
          @permiso_documento_usuario.permiso_documento_id = p
          @permiso_documento_usuario.estado = "A"
          @permiso_documento_usuario.user_created_id = current_user.id

          @permiso_documento_usuario.save
          genera_bitacora_acceso("PERMISO_DOCUMENTO_USUARIOS", "INSERTAR", nil, nil, nil, nil, nil, @permiso_documento_usuario.permiso_documento_id, @permiso_documento_usuario.user_id, @permiso_documento_usuario.id,
                                nil, @permiso_documento_usuario.user_created_id, nil, @permiso_documento_usuario.estado)
        end
      end 
    end 
    respond_to do |format|
      format.html { redirect_to permiso_documento_usuarios_url, notice: "El Permiso Documento Usuario se ha creado correctamente." }
      format.json { render :show, status: :created, location: @permiso_documento_usuario }
    end 
  end

  # PATCH/PUT /permiso_documento_usuarios/1 or /permiso_documento_usuarios/1.json
  def update
    @permiso_documento_usuario.user_updated_id = current_user.id

    respond_to do |format|
      if @permiso_documento_usuario.update(permiso_documento_usuario_params)
        format.html { redirect_to permiso_documento_usuarios_url(@permiso_documento_usuario), notice: "El codigo #{@permiso_documento_usuario.id} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @permiso_documento_usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permiso_documento_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permiso_documento_usuarios/1 or /permiso_documento_usuarios/1.json
  def destroy
    @permiso_documento_usuario.destroy

    respond_to do |format|
      format.html { redirect_to permiso_documento_usuarios_url, notice: "El codigo #{@permiso_documento_usuario.id} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Permiso Documento Usuario
  def inactivar_documentos
    documentos_ids = params[:documentos_ids]
    if documentos_ids.present?
      documentos_ids.each do |id|
        @consulta_documento = PermisoDocumentoUsuario.find(id)
        @permiso_documento_usuario = PermisoDocumentoUsuario.find(id)

        if @consulta_documento.estado == "A"
          @permiso_documento_usuario.update(user_updated_id: current_user.id, estado: 'I') # Suponiendo que 'I' es el estado para documentos inactivos
          genera_bitacora_acceso("PERMISO_DOCUMENTO_USUARIOS", "INACTIVAR", nil, nil, nil, nil, nil, @permiso_documento_usuario.permiso_documento_id, @permiso_documento_usuario.user_id, @permiso_documento_usuario.id,
                                nil, @permiso_documento_usuario.user_created_id, @permiso_documento_usuario.user_updated_id, @permiso_documento_usuario.estado)
        elsif @consulta_documento.estado == "I"
          @permiso_documento_usuario.update(user_updated_id: current_user.id, estado: 'A') # Suponiendo que 'I' es el estado para documentos inactivos
          genera_bitacora_acceso("PERMISO_DOCUMENTO_USUARIOS", "ACTIVAR", nil, nil, nil, nil, nil, @permiso_documento_usuario.permiso_documento_id, @permiso_documento_usuario.user_id, @permiso_documento_usuario.id,
                                nil, @permiso_documento_usuario.user_created_id, @permiso_documento_usuario.user_updated_id, @permiso_documento_usuario.estado)
        end
        
      end
      flash[:notice] = "Documentos actualizados exitosamente."
    else
      flash[:error] = "No se seleccionaron documentos."
    end
    redirect_to permiso_documento_usuarios_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permiso_documento_usuario
      @permiso_documento_usuario = PermisoDocumentoUsuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permiso_documento_usuario_params
      params.require(:permiso_documento_usuario).permit(:user_created_id, :user_updated_id, :estado, :user_id, :permiso_documento_id)
    end
end
