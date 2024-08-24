class PermisoDocumentosController < ApplicationController
  before_action :set_permiso_documento, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /permiso_documentos or /permiso_documentos.json
  def index
    #@permiso_documentos = PermisoDocumento.order("tipo_usuario_id ASC")   
    #@permiso_documentos = PermisoDocumento.select(:id, :tipo_usuario_id, :proceso_id, :tipo_sistema_id, :tipo_documento_id,:estado).group(:id, :tipo_usuario_id, :proceso_id, :tipo_sistema_id, :tipo_documento_id, :estado)    

    @clasifica_documento_id = params[:clasifica_documento_id]  
    
    @permiso_documento_encabezado = PermisoDocumento.select("tipo_usuario_id").order("tipo_usuario_id ASC").distinct
    

    respond_to do |format|    
      format.html
      format.json { render json: PermisoDocumentoDatatable.new(params, view_context: view_context, clasifica_documento_id: @clasifica_documento_id) }
    end
  end

  # GET /permiso_documentos/1 or /permiso_documentos/1.json
  def show
  end

  # GET /permiso_documentos/new
  def new
    @permiso_documento = PermisoDocumento.new
  end

  # GET /permiso_documentos/1/edit
  def edit
  end

  # POST /permiso_documentos or /permiso_documentos.json
  def create
    tipo_usuario_id = params[:permiso_documento][:tipo_usuario_id]
    #tipo_sistema_id = params[:permiso_documento][:tipo_sistema_id]

    key_compuesto_permiso = params[:permiso_documento][:tipo_documento_id]
    key_proceso = params[:permiso_documento][:proceso_id]
    documento = params[:permiso_documento][:documento_id]
    
    key_proceso.each do |p|
      proceso = p.split("|")
      proceso[0].split(",").each do |f|
        tipo_sistema_id = f
        key_compuesto_permiso.each do |h|
          array_key_compuesto = h.split("|")
          tipo_doc_id = array_key_compuesto[2]
          
          documento.each do |d|
            
            if tipo_sistema_id != '0' && proceso[1] != '0' && tipo_doc_id != '0' && d != '0'
              @consulta_permiso_documento = Documento.where("tipo_sistema_id=? and proceso_id=? and tipo_documento_id=? and id=? and estado=?", tipo_sistema_id, proceso[1],tipo_doc_id,d,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id != '0' && proceso[1] != '0' && tipo_doc_id != '0' && d == '0'
              @consulta_permiso_documento = Documento.where("tipo_sistema_id=? and proceso_id=? and tipo_documento_id=? and estado=?", tipo_sistema_id, proceso[1],tipo_doc_id,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id != '0' && proceso[1] != '0' && tipo_doc_id == '0' && d == '0'
              @consulta_permiso_documento = Documento.where("tipo_sistema_id=? and proceso_id=? and estado=?", tipo_sistema_id, proceso[1],'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id != '0' && proceso[1] == '0' && tipo_doc_id == '0' && d == '0'
              @consulta_permiso_documento = Documento.where("tipo_sistema_id=? and estado=?", tipo_sistema_id, 'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id != '0' && proceso[1] != '0' && tipo_doc_id == '0' && d != '0'
              @consulta_permiso_documento = Documento.where("tipo_sistema_id=? and proceso_id=? and id=? and estado=?", tipo_sistema_id, proceso[1],d,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id != '0' && proceso[1] == '0' && tipo_doc_id != '0' && d != '0'
              @consulta_permiso_documento = Documento.where("tipo_sistema_id=? and tipo_documento_id=? and id=? and estado=?", tipo_sistema_id,tipo_doc_id,d,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id != '0' && proceso[1] == '0' && tipo_doc_id != '0' && d == '0'
              @consulta_permiso_documento = Documento.where("tipo_sistema_id=? and tipo_documento_id=? and estado=?", tipo_sistema_id,tipo_doc_id,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id != '0' && proceso[1] == '0' && tipo_doc_id == '0' && d != '0'
              @consulta_permiso_documento = Documento.where("tipo_sistema_id=? and id=? and estado=?", tipo_sistema_id,d,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id == '0' && proceso[1] == '0' && tipo_doc_id == '0' && d != '0'
              @consulta_permiso_documento = Documento.where("id=? and estado=?",d,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id == '0' && proceso[1] == '0' && tipo_doc_id != '0' && d != '0'
              @consulta_permiso_documento = Documento.where("tipo_documento_id=? and id=? and estado=?",tipo_doc_id,d,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id == '0' && proceso[1] != '0' && tipo_doc_id != '0' && d != '0'
              @consulta_permiso_documento = Documento.where("proceso_id=? and tipo_documento_id=? and id=? and estado=?",proceso[1],tipo_doc_id,d,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id == '0' && proceso[1] == '0' && tipo_doc_id != '0' && d == '0'
              @consulta_permiso_documento = Documento.where("tipo_documento_id=? and estado=?",tipo_doc_id,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id == '0' && proceso[1] != '0' && tipo_doc_id == '0' && d == '0'
              @consulta_permiso_documento = Documento.where("proceso_id=? and estado=?",proceso[1],'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id == '0' && proceso[1] != '0' && tipo_doc_id == '0' && d != '0'
              @consulta_permiso_documento = Documento.where("proceso_id=? and id=? and estado=?",proceso[1],d,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            elsif tipo_sistema_id == '0' && proceso[1] != '0' && tipo_doc_id != '0' && d == '0'
              @consulta_permiso_documento = Documento.where("proceso_id=? and tipo_documento_id=? and estado=?",proceso[1],tipo_doc_id,'A')
              if !@consulta_permiso_documento.blank?
                @permiso_documento = PermisoDocumento.new
                @permiso_documento.tipo_usuario_id = tipo_usuario_id
                @permiso_documento.tipo_sistema_id = tipo_sistema_id
                @permiso_documento.proceso_id = proceso[1]
                @permiso_documento.tipo_documento_id = tipo_doc_id
                @permiso_documento.documento_id = d
                @permiso_documento.estado = "A"
                @permiso_documento.user_created_id = current_user.id
                @permiso_documento.save

                genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                      nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
              end

            else
              @permiso_documento = PermisoDocumento.new
              @permiso_documento.tipo_usuario_id = tipo_usuario_id
              @permiso_documento.tipo_sistema_id = tipo_sistema_id
              @permiso_documento.proceso_id = proceso[1]
              @permiso_documento.tipo_documento_id = tipo_doc_id
              @permiso_documento.documento_id = d
              @permiso_documento.estado = "A"
              @permiso_documento.user_created_id = current_user.id
              @permiso_documento.save

              genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INSERTAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                                    nil, @permiso_documento.user_created_id, nil, @permiso_documento.estado)
            end
          end 
        end
      end
    end 
    respond_to do |format|
      format.html { redirect_to permiso_documentos_url(@permiso_documento), notice: "La Clasificación de Permisos se ha creado correctamente." }
      format.json { render :show, status: :created, location: @permiso_documento }
    end
  end

  # PATCH/PUT /permiso_documentos/1 or /permiso_documentos/1.json
  def update
    if params[:permiso_documento][:proceso_id].include?('|')
      key_compuesto_permiso = params[:permiso_documento][:proceso_id]
      array_key = key_compuesto_permiso.split("|")
      sistema = array_key[0]
      proceso = array_key[1]
    else
      sistema = params[:permiso_documento][:tipo_sistema_id]
      proceso = params[:permiso_documento][:proceso_id]
    end

    if params[:permiso_documento][:tipo_documento_id].include?('|')
      key_compuesto_tipo_doc = params[:permiso_documento][:tipo_documento_id]
      array_key_tipo_doc = key_compuesto_tipo_doc.split("|")
      tipo_documento = array_key_tipo_doc[2]
    else
      tipo_documento = params[:permiso_documento][:tipo_documento_id]
    end

    tipo_usuario = params[:permiso_documento][:tipo_usuario_id]
    documento = params[:permiso_documento][:documento_id]

    @permiso_documento = PermisoDocumento.find(params[:id])
    @permiso_documento.tipo_usuario_id = tipo_usuario
    @permiso_documento.tipo_sistema_id = sistema
    @permiso_documento.proceso_id = proceso
    @permiso_documento.tipo_documento_id = tipo_documento
    @permiso_documento.documento_id = documento
    @permiso_documento.user_updated_id = current_user.id

    respond_to do |format|
      if @permiso_documento.update(permiso_documento_params)
        @permiso_documento = PermisoDocumento.find(params[:id])
        @permiso_documento.tipo_usuario_id = tipo_usuario
        @permiso_documento.tipo_sistema_id = sistema
        @permiso_documento.proceso_id = proceso
        @permiso_documento.tipo_documento_id = tipo_documento
        @permiso_documento.documento_id = documento
        @permiso_documento.user_updated_id = current_user.id

        format.html { redirect_to permiso_documentos_url(@permiso_documento), notice: "El codigo #{@permiso_documento.id} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @permiso_documento }

        if @permiso_documento.save
          @permiso_documento = PermisoDocumento.find(params[:id])
          @permiso_documento.tipo_usuario_id = tipo_usuario
          @permiso_documento.tipo_sistema_id = sistema
          @permiso_documento.proceso_id = proceso
          @permiso_documento.tipo_documento_id = tipo_documento
          @permiso_documento.documento_id = documento
          @permiso_documento.user_updated_id = current_user.id

          format.html { redirect_to permiso_documentos_url(@permiso_documento), notice: "El codigo #{@permiso_documento.id} se ha actualizado correctamente." }
          format.json { render :show, status: :ok, location: @permiso_documento }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @permiso_documento.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permiso_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permiso_documentos/1 or /permiso_documentos/1.json
  def destroy
    @permiso_documento.destroy

    respond_to do |format|
      format.html { redirect_to permiso_documentos_url, notice: "El codigo #{@permiso_documento.id} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  def inactivar_permiso_documentos
    selected_permisos = params[:permiso_documentos_ids]
    if selected_permisos.present?
      selected_permisos.each do |id|
        @consulta_documento = PermisoDocumento.find(id)
        @permiso_documento = PermisoDocumento.find(id)

        if @consulta_documento.estado == "A"
          @permiso_documento.update(user_updated_id: current_user.id, estado: 'I') # Suponiendo que 'I' es el estado para documentos inactivos
          genera_bitacora_acceso("PERMISO_DOCUMENTOS", "INACTIVAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                               nil, @permiso_documento.user_created_id, @permiso_documento.user_updated_id, @permiso_documento.estado)
        elsif @consulta_documento.estado == "I"
          @permiso_documento.update(user_updated_id: current_user.id, estado: 'A') # Suponiendo que 'I' es el estado para documentos inactivos
          genera_bitacora_acceso("PERMISO_DOCUMENTOS", "ACTIVAR", @permiso_documento.tipo_usuario_id, @permiso_documento.tipo_sistema_id, @permiso_documento.proceso_id, @permiso_documento.tipo_documento_id, @permiso_documento.documento_id, @permiso_documento.id, nil, nil,
                               nil, @permiso_documento.user_created_id, @permiso_documento.user_updated_id, @permiso_documento.estado)
        end
        
      end
      flash[:notice] = "Documentos actualizados exitosamente."
    else
      flash[:error] = "No se seleccionaron documentos."
    end
    redirect_to permiso_documentos_url
  end

  def set_sistema
    @key_sistema = params[:id_sistema]

    if @key_sistema != '0'
      @sistema_documento = Documento.where("estado ='A' and tipo_sistema_id in(#{@key_sistema})").order("id asc")
    else
      @sistema_documento = Documento.where("estado ='A' or estado is null").order("id asc")
    end

    respond_to do |format|
      format.json { render json: @sistema_documento.map { |e| { id_documento: "#{@key_sistema}|#{e.id}", codigo_documento: e.codigo.nil? ? '' : e.codigo, correlativo_documento: e.correlativo.nil? ? '' : format_digitos(e.correlativo), nombre: e.nombre } } }
    end
  end

  def obtener_procesos_sistema
    @sistemas = params[:id_sistema]
    @key_sistema = @sistemas.join(",")
    puts "************ OBTENIENDO SISTEMA #{@key_sistema}"

    if @key_sistema != '0'
      @sistema_proceso= Documento.select(:proceso_id).where("estado ='A' and tipo_sistema_id in(#{@key_sistema}) or tipo_sistema_id=0").order("proceso_id asc").distinct
    else
      @sistema_proceso = Documento.select(:proceso_id).where("estado ='A' or estado is null").order("proceso_id asc").distinct
    end

    respond_to do |format|
      format.json { render json: @sistema_proceso.map { |e| { proceso_id: "#{@key_sistema}|#{e.proceso_id}", nombre_proceso: e.proceso.nombre } } }
    end
  end

  def set_proceso_documento
    @key_proceso = params[:ids_proceso]
    key_proceso_split = @key_proceso.split("|")

    sistema = key_proceso_split[0]
    proceso = key_proceso_split[1]


    if sistema != '0' && proceso == '0'
      @proceso_documento = Documento.where("estado ='A' and tipo_sistema_id in(#{sistema}) or tipo_sistema_id=0").order("id asc")
    elsif sistema != '0' && proceso != '0'
      @proceso_documento = Documento.where("estado ='A' and tipo_sistema_id in(#{sistema}) and proceso_id in(#{proceso}) or proceso_id=0").order("id asc")
    elsif sistema == '0' && proceso != '0'
      @proceso_documento = Documento.where("estado ='A' and proceso_id in(#{proceso}) or proceso_id=0").order("id asc")
    else
      @proceso_documento = Documento.where("estado ='A' or estado is null").order("id asc")
    end

    respond_to do |format|
      format.json { render json: @proceso_documento.map { |e| { ids_documento: "#{@key_proceso}|#{e.id}", codigos_documento: e.codigo.nil? ? '' : e.codigo, correlativos_documento: e.correlativo.nil? ? '' : format_digitos(e.correlativo), nombres: e.nombre } } }
    end
  end

  def obtener_proceso_tipoDocumento
    @key_proceso = params[:ids_proceso]   
  
    @array_procesos = Array.new
    @sistema_id = nil

    @key_proceso.each do |p|
      key_proceso_split = p.split("|")      
      @array_procesos.push(key_proceso_split[1])
      @sistema_id  = key_proceso_split[0]
    end 

    proceso = @array_procesos.join(",")
    
    if @sistema_id != '0' && proceso == '0'
      @proceso_tipoDocumento = Documento.select(:tipo_documento_id).where("estado ='A' and tipo_sistema_id in(#{@sistema_id}) or tipo_sistema_id = 0").order("tipo_documento_id asc").distinct
    elsif @sistema_id != '0' && proceso != '0'
      @proceso_tipoDocumento = Documento.select(:tipo_documento_id).where("estado ='A' and tipo_sistema_id in(#{@sistema_id}) and proceso_id in(#{proceso}) or proceso_id=0").order("tipo_documento_id asc").distinct
    elsif @sistema_id == '0' && proceso != '0'
      @proceso_tipoDocumento = Documento.select(:tipo_documento_id).where("estado ='A' and proceso_id in(#{proceso}) or proceso_id=0").order("tipo_documento_id asc").distinct
    else
      @proceso_tipoDocumento = Documento.select(:tipo_documento_id).where("estado ='A' or estado is null").order("tipo_documento_id asc").distinct
    end

    respond_to do |format|
      format.json { render json: @proceso_tipoDocumento.map { |e| { tiposDocumentos_ids: "#{@sistema_id}|#{proceso}|#{e.tipo_documento_id}", nombre_tipoDocumento: e.tipo_documento.nombre } } }
    end
  end

  def set_tipoDocumento_documento
    @key_tipoDocumento = params[:ids_tipo_documento].to_a

    @array_tipo_documento = Array.new

    @key_tipoDocumento.each do |d|
      key_tipo_doc_split = d.split("|")                  
      @sistema_id  = key_tipo_doc_split[0]
      @proceso_id  = key_tipo_doc_split[1]
      @array_tipo_documento.push(key_tipo_doc_split[2])      
    end 
    tipoDocumento = @array_tipo_documento.join(",")

    if @sistema_id  != '0' && @proceso_id == '0' && tipoDocumento == '0'
      @tipoDocumento_documento = Documento.where("estado ='A' and tipo_sistema_id in(#{@sistema_id}) or tipo_sistema_id=0").order("id asc")
    elsif @sistema_id  != '0' && @proceso_id != '0' && tipoDocumento == '0'
      @tipoDocumento_documento = Documento.where("estado ='A' and tipo_sistema_id in(#{@sistema_id}) and proceso_id in(#{@proceso_id}) or proceso_id=0").order("id asc")
    elsif @sistema_id  != '0' && @proceso_id != '0' && tipoDocumento != '0'
      @tipoDocumento_documento = Documento.where("estado ='A' and tipo_sistema_id in(#{@sistema_id}) and proceso_id in(#{@proceso_id}) and tipo_documento_id in(#{tipoDocumento}) or tipo_documento_id=0").order("id asc")

    elsif @sistema_id  != '0' && @proceso_id == '0' && tipoDocumento != '0'
      @tipoDocumento_documento = Documento.where("estado ='A' and tipo_sistema_id in(#{@sistema_id}) and tipo_documento_id in(#{tipoDocumento}) or tipo_documento_id=0").order("id asc")
    elsif @sistema_id  == '0' && @proceso_id != '0' && tipoDocumento != '0'
      @tipoDocumento_documento = Documento.where("estado ='A' and proceso_id in(#{@proceso_id}) and tipo_documento_id in(#{tipoDocumento}) or tipo_documento_id=0").order("id asc")

    elsif @sistema_id  == '0' && @proceso_id != '0' && tipoDocumento == '0'
      @tipoDocumento_documento = Documento.where("estado ='A' and proceso_id in(#{@proceso_id}) or proceso_id=0").order("id asc")
    elsif @sistema_id  == '0' && @proceso_id == '0' && tipoDocumento != '0'
      @tipoDocumento_documento = Documento.where("estado ='A' and tipo_documento_id in(#{tipoDocumento}) or tipo_documento_id=0").order("id asc")

    else
      @tipoDocumento_documento = Documento.where("estado is null").order("id asc")
    end    

    respond_to do |format|
      format.json { render json: @tipoDocumento_documento.map { |e| { id_documentos: e.id, codigo_documentos: e.codigo.nil? ? '' : e.codigo, correlativo_documentos: e.correlativo.nil? ? '' : format_digitos(e.correlativo), nombress: e.nombre } } }
    end
  end

  def download_excel_formats
    @titulo_formato_excel = "PERMISO DOCUMENTOS"

    @modulo_permiso_documento = PermisoDocumento.select("(CASE WHEN PERMISO_DOCUMENTOS.ESTADO ='A' THEN 'ACTIVO' WHEN PERMISO_DOCUMENTOS.ESTADO ='I' THEN 'INACTIVO' ELSE '' END) AS ESTADO_PERMISO,
                                                        PERMISO_DOCUMENTOS.TIPO_USUARIO_ID, PERMISO_DOCUMENTOS.TIPO_SISTEMA_ID, PERMISO_DOCUMENTOS.PROCESO_ID,PERMISO_DOCUMENTOS.TIPO_DOCUMENTO_ID, PERMISO_DOCUMENTOS.DOCUMENTO_ID,
                                                        TIPO_USUARIOS.NOMBRE AS NOMBRE_CLASIFICA_DOCUMENTO, TIPO_SISTEMAS.NOMBRE AS NOMBRE_TIPO_SISTEMA, PROCESOS.NOMBRE AS NOMBRE_PROCESO, PROCESOS.MACRO_PROCESO_ID, PROCESOS.TIPO_PROCESO_ID, MACRO_PROCESOS.NOMBRE AS NOMBRE_MACRO_PROCESO, TIPO_DOCUMENTOS.NOMBRE AS NOMBRE_TIPO_DOCUMENTO, TIPO_PROCESOS.NOMBRE AS NOMBRE_TIPO_PROCESO,
                                                        TIPO_DOCUMENTOS.NOMBRE AS NOMBRE_TIPO_DOCUMENTO, (DOCUMENTOS.CODIGO||LPAD(DOCUMENTOS.CORRELATIVO,3,'0')) AS CODIGO_DOCUMENTO, DOCUMENTOS.NOMBRE AS NOMBRE_DOCUMENTO, DOCUMENTOS.FECHA_VIGENCIA, DOCUMENTOS.VERSION, PERMISO_DOCUMENTOS.CREATED_AT")
                                                .joins("INNER JOIN TIPO_USUARIOS ON(PERMISO_DOCUMENTOS.TIPO_USUARIO_ID=TIPO_USUARIOS.ID)
                                                        INNER JOIN TIPO_SISTEMAS ON(PERMISO_DOCUMENTOS.TIPO_SISTEMA_ID=TIPO_SISTEMAS.ID)
                                                        INNER JOIN PROCESOS ON(PERMISO_DOCUMENTOS.PROCESO_ID=PROCESOS.ID)
                                                        INNER JOIN TIPO_DOCUMENTOS ON(PERMISO_DOCUMENTOS.TIPO_DOCUMENTO_ID=TIPO_DOCUMENTOS.ID)
                                                        INNER JOIN DOCUMENTOS ON(PERMISO_DOCUMENTOS.DOCUMENTO_ID=DOCUMENTOS.ID)
                                                        INNER JOIN MACRO_PROCESOS ON(PROCESOS.MACRO_PROCESO_ID=MACRO_PROCESOS.ID)
                                                        INNER JOIN TIPO_PROCESOS  ON(PROCESOS.TIPO_PROCESO_ID=TIPO_PROCESOS.ID)")
                                                .order("NOMBRE_CLASIFICA_DOCUMENTO, NOMBRE_TIPO_SISTEMA")

    @nombre_columnas = []    
    @ids_columnas = []

    @nombre_columnas.push("CLASIFICACIÓN DOCUMENTO")    
    @nombre_columnas.push("SISTEMA")
    @nombre_columnas.push("PROCESO")
    @nombre_columnas.push("TIPO_DOCUMENTO")
    @nombre_columnas.push("DOCUMENTO")
    @nombre_columnas.push("ESTADO")
    @nombre_columnas.push("FECHA CREACIÓN DE PERMISOS")
    
    @ids_columnas.push("CD")
    @ids_columnas.push("NTS")
    @ids_columnas.push("NP")
    @ids_columnas.push("NTD")
    @ids_columnas.push("ND")
    @ids_columnas.push("EP")
    @ids_columnas.push("CP")
   
    render xlsx: 'formato-permiso-documento', 
           template: 'permiso_documentos/template_excel_download.xlsx.axlsx'
  end 
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permiso_documento
      @permiso_documento = PermisoDocumento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permiso_documento_params
      params.require(:permiso_documento).permit(:tipo_usuario_id, :proceso_id, :tipo_sistema_id, :documento_id, :todo, :user_created_id, :user_updated_id, :estado, :tipo_documento_id)
    end
end

