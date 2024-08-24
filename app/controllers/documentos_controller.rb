class DocumentosController < ApplicationController
  before_action :set_documento, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /documentos or /documentos.json
  def index
    @permiso_usuario = PermisoDocumentoUsuario.select("permiso_documentos.proceso_id, permiso_documentos.tipo_sistema_id, permiso_documentos.tipo_documento_id, permiso_documentos.documento_id")
                                              .joins("inner join permiso_documentos on(permiso_documento_usuarios.permiso_documento_id=permiso_documentos.id)
                                                      where permiso_documento_usuarios.estado='A'
                                                      and permiso_documentos.estado='A'
                                                      and permiso_documento_usuarios.user_id=#{current_user.id}")

    if !@permiso_usuario.blank?
      @lista_procesos = DocumentoView.select("DOCUMENTOS_VIEWS.PROCESO_ID, DOCUMENTOS_VIEWS.NOMBRE_PROCESO")
                                     .joins("INNER JOIN PERMISO_DOCUMENTOS ON(DOCUMENTOS_VIEWS.ID=PERMISO_DOCUMENTOS.DOCUMENTO_ID)
                                             INNER JOIN PERMISO_DOCUMENTO_USUARIOS ON(PERMISO_DOCUMENTOS.ID=PERMISO_DOCUMENTO_USUARIOS.PERMISO_DOCUMENTO_ID)")
                                      .where("PERMISO_DOCUMENTO_USUARIOS.USER_ID=?",current_user.id).distinct

      if session[:filtroProcesoDocumento].nil?
        @procesoDocumento = DocumentoView.select("DOCUMENTOS_VIEWS.PROCESO_ID, DOCUMENTOS_VIEWS.NOMBRE_PROCESO")
                                         .joins("INNER JOIN PERMISO_DOCUMENTOS ON(DOCUMENTOS_VIEWS.ID=PERMISO_DOCUMENTOS.DOCUMENTO_ID)
                                                INNER JOIN PERMISO_DOCUMENTO_USUARIOS ON(PERMISO_DOCUMENTOS.ID=PERMISO_DOCUMENTO_USUARIOS.PERMISO_DOCUMENTO_ID)")
                                         .where("PERMISO_DOCUMENTO_USUARIOS.USER_ID=?",current_user.id).distinct

        if !@procesoDocumento.blank?
          @proceso_select = ""
        end
      else
        @proceso_select = session[:filtroProcesoDocumento]

        if @proceso_select.blank?
          @procesoDocumento = ""
        else
          @procesoDocumento = DocumentoView.select("DOCUMENTOS_VIEWS.PROCESO_ID, DOCUMENTOS_VIEWS.NOMBRE_PROCESO")
                                         .joins("INNER JOIN PERMISO_DOCUMENTOS ON(DOCUMENTOS_VIEWS.ID=PERMISO_DOCUMENTOS.DOCUMENTO_ID)
                                                INNER JOIN PERMISO_DOCUMENTO_USUARIOS ON(PERMISO_DOCUMENTOS.ID=PERMISO_DOCUMENTO_USUARIOS.PERMISO_DOCUMENTO_ID)")
                                         .where("PERMISO_DOCUMENTO_USUARIOS.USER_ID=? AND DOCUMENTOS_VIEWS.PROCESO_ID IN(?)",current_user.id,@proceso_select).distinct
        end
      end

      respond_to do |format|    
        format.html
        format.json { render json: DocumentoDatatable.new(params, view_context: view_context, proceso_id: @proceso_select) }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url, alert: "No tiene permiso suficiente, Favor comunicarse con el Área de Sistema de Gestión" }
        format.json { render :show, status: :created, location: @permiso_usuario }
      end
    end

    @tituloBotonSubmit = "FILTRAR"
    @colorBotonSubmit = "btn btn-primary btn-sm"
  end

  def filtro_proceso_documento
    proceso_id = params[:filtro_proceso_form][:proceso_id] rescue 0

    if proceso_id != 0
      session[:filtroProcesoDocumento] = proceso_id
    else
      session[:filtroProcesoDocumento] = nil
    end
    
    redirect_to documentos_path
  end

  def borrar_filtro_proceso_documento
    session[:filtroProcesoDocumento] = nil

    redirect_to documentos_path
  end

  # GET /documentos/1 or /documentos/1.json
  def show
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
      @proceso_key_view = "#{@documento.proceso.empresa_id}|#{@documento.proceso.macro_proceso_id}|#{@documento.proceso.id}"
  end

  # POST /documentos or /documentos.json
  def create
    key_compuesto = params[:documento][:tipo_documento_id]
    array_key = key_compuesto.split("|")
    proceso = array_key[2]
    tipo_documento = array_key[3]
    tipo_sistema = params[:documento][:tipo_sistema_id]
    codigo = params[:documento][:codigo]
    correlativo = params[:documento][:correlativo]
    version = params[:documento][:version]
    fecha_vigencia = params[:documento][:fecha_vigencia]
    estado_documento_id = params[:documento][:estado_documento_id]
    nombre = params[:documento][:nombre]
    descripcion = params[:documento][:descripcion]

    @documento = Documento.new(documento_params)
    @documento.codigo = codigo
    @documento.correlativo = correlativo
    @documento.nombre = nombre
    @documento.fecha_vigencia = fecha_vigencia
    @documento.version = version
    @documento.descripcion = descripcion
    @documento.empresa_id = current_user_empresa_id
    @documento.estado_documento_id = 1 #estado_documento_id
    @documento.estado = "A"
    @documento.proceso_id = proceso
    @documento.tipo_sistema_id = tipo_sistema
    @documento.tipo_documento_id = tipo_documento
    @documento.user_created_id = current_user.id
    @parametro_docto_word = params[:documento][:file_word]
    @parametro_docto_excel = params[:documento][:file_excel]

    respond_to do |format|
      if @documento.save
        genera_bitacora("DOCUMENTO_AUTORIZADO", @documento.codigo, @documento.correlativo, @documento.nombre, @documento.fecha_vigencia, @documento.version, @documento.descripcion, @documento.estado, @documento.user_created_id, nil,
                        @documento.empresa_id, @documento.proceso_id, @documento.tipo_sistema_id, @documento.id, @documento.tipo_documento_id, @documento.estado_documento_id, nil, nil, nil, nil)

        if !@parametro_docto_word.nil?
          #GENERAR VERSION PARA WORD PREVIEW
          @file_cargado = @documento.file_word
          crear_docto_to_preview(@file_cargado, @documento.file_word_preview)
        end

        if !@parametro_docto_excel.nil?
          #GENERAR VERSION PARA EXCEL PREVIEW
          @file_cargado = @documento.file_excel
          crear_docto_to_preview(@file_cargado, @documento.file_excel_preview)
        end

        format.html { redirect_to documentos_url, notice: "El codigo #{@documento.codigo.upcase}#{@documento.correlativo} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el Codigo, Verifique!!.." }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1 or /documentos/1.json
  def update
    key_compuesto = params[:documento][:proceso_id]
    array_key = key_compuesto.split("|")    
    proceso = array_key[2]

    if params[:documento][:tipo_documento_id].include?('|')
      key_compuesto_tipo_doc = params[:documento][:tipo_documento_id]
      array_key_tipo_doc = key_compuesto_tipo_doc.split("|")    
      tipo_documento = array_key_tipo_doc[3]
    else
      tipo_documento = params[:documento][:tipo_documento_id]
    end
    
    tipo_sistema = params[:documento][:tipo_sistema_id]
    codigo = params[:documento][:codigo]
    correlativo = params[:documento][:correlativo]
    version = params[:documento][:version]
    fecha_vigencia = params[:documento][:fecha_vigencia]
    estado_documento_id = 1
    nombre = params[:documento][:nombre]
    descripcion = params[:documento][:descripcion]

    @documento = Documento.find(params[:id])
    @documento.codigo = codigo
    @documento.correlativo = correlativo
    @documento.nombre = nombre
    @documento.fecha_vigencia = fecha_vigencia
    @documento.version = version
    @documento.descripcion = descripcion
    @documento.estado_documento_id = estado_documento_id
    @documento.proceso_id = proceso
    @documento.tipo_sistema_id = tipo_sistema
    @documento.tipo_documento_id = tipo_documento
    @documento.user_updated_id = current_user.id
    @parametro_pdf = params[:documento][:file_pdf]
    @parametro_word = params[:documento][:file_word]
    @parametro_excel = params[:documento][:file_excel]

    respond_to do |format|
      if @parametro_pdf.nil? && @parametro_word.nil? && @parametro_excel.nil?
        if @documento.save
          genera_bitacora("DOCUMENTO_AUTORIZADO", @documento.codigo, @documento.correlativo, @documento.nombre, @documento.fecha_vigencia, @documento.version, @documento.descripcion, @documento.estado, @documento.user_created_id, @documento.user_updated_id,
                          @documento.empresa_id, @documento.proceso_id, @documento.tipo_sistema_id, @documento.id, @documento.tipo_documento_id, @documento.estado_documento_id, nil, nil, nil, nil)
          
          format.html { redirect_to documentos_url, notice: "El codigo #{@documento.codigo.upcase}#{@documento.correlativo} se ha actualizado correctamente." }
          format.json { render :show, status: :ok, location: @documento }
        else
          format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el Codigo, Verifique!!.." }
          format.json { render json: @documento.errors, status: :unprocessable_entity }
        end
      else
        if @documento.update(documento_params)
          @documento = Documento.find(params[:id])
          @documento.codigo = codigo
          @documento.correlativo = correlativo
          @documento.nombre = nombre
          @documento.fecha_vigencia = fecha_vigencia
          @documento.version = version
          @documento.descripcion = descripcion
          @documento.estado_documento_id = estado_documento_id
          @documento.proceso_id = proceso
          @documento.tipo_sistema_id = tipo_sistema
          @documento.tipo_documento_id = tipo_documento
          @documento.user_updated_id = current_user.id

          if @documento.save
            genera_bitacora("DOCUMENTO_AUTORIZADO", @documento.codigo, @documento.correlativo, @documento.nombre, @documento.fecha_vigencia, @documento.version, @documento.descripcion, @documento.estado, @documento.user_created_id, @documento.user_updated_id,
                            @documento.empresa_id, @documento.proceso_id, @documento.tipo_sistema_id, @documento.id, @documento.tipo_documento_id, @documento.estado_documento_id, nil, nil, nil, nil)

            if !@parametro_word.nil?
              #GENERAR VERSION PARA WORD PREVIEW
              @file_cargado = @documento.file_word
              crear_docto_to_preview(@file_cargado, @documento.file_word_preview)
            end

            if !@parametro_excel.nil?
              #GENERAR VERSION PARA EXCEL PREVIEW
              @file_cargado = @documento.file_excel
              crear_docto_to_preview(@file_cargado, @documento.file_excel_preview)
            end

            format.html { redirect_to documentos_url, notice: "El codigo #{@documento.codigo.upcase}#{@documento.correlativo} se ha actualizado correctamente." }
            format.json { render :show, status: :ok, location: @documento }
          else
            format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el Codigo, Verifique!!.." }
            format.json { render json: @documento.errors, status: :unprocessable_entity }
          end
        else
          format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el Codigo, Verifique!!.." }
          format.json { render json: @documento.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /documentos/1 or /documentos/1.json
  def destroy
    @documento.destroy

    respond_to do |format|
      format.html { redirect_to documentos_url, notice: "El codigo #{@documento.codigo.upcase}#{@documento.correlativo} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Documento
  def inactivar_documento
    @documento = Documento.find(params[:id])
    @documento.user_updated_id = current_user.id
    @documento.estado = "I"

    respond_to do |format|
      if @documento.save
        format.html { redirect_to documentos_url, notice: "El codigo #{@documento.codigo.upcase}#{@documento.correlativo} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { redirect_to documentos_url, alert: "Ocurrio un error al inactivar Documento, Verifique!!.." }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end
  def search_descripcion
    key_proceso_compuesta = params[:id_proceso]

    puts"********************* id proceso #{key_proceso_compuesta}"

    @tipo_documento = TipoDocumento.where(estado: 'A')

    respond_to do |format|
      format.json { render json: @tipo_documento.map { |e| { id_documento: "#{key_proceso_compuesta}|#{e.id}", nombre: e.nombre } } }
    end
  end

  def set_codigo
    key_compuesta = params[:id_compuesto_final]
    key_compuesta_split = key_compuesta.split("|")

    puts"******** empresa #{key_compuesta_split[0]}"
    puts"******** macroproceso #{key_compuesta_split[1]}"
    puts"******** proceso #{key_compuesta_split[2]}"
    puts"******** documento #{key_compuesta_split[3]}"
    empresa = key_compuesta_split[0]
    macroproceso = key_compuesta_split[1]
    proceso = key_compuesta_split[2]
    tipo_documento = key_compuesta_split[3]

    @macro_proceso = MacroProceso.where(id: macroproceso).first
    @proceso = Proceso.where(id: proceso).first
    @tipo_documento = TipoDocumento.where(id: tipo_documento).first

    @codigo_compuesto = "#{empresa}-#{@macro_proceso.abreviatura}-#{@proceso.abreviatura}-#{@tipo_documento.abreviatura}-"
    puts"******************* codigo #{@codigo_compuesto}"

    respond_to do |format|
      format.json { render json: { descripcion: @codigo_compuesto } }
    end

  end

  def modal_preview_file
    @documento_id = params[:id]
    tipo_file = params[:tipo_file]
    @opcion = params[:opcion].to_i

    if @opcion == 1
      if tipo_file == 'pdf'
        @completo = Documento.find(@documento_id)
        @docto_for_download = Documento.find(@documento_id).file_pdf.blob
        @docto_for_preview = Documento.find(@documento_id).file_pdf.blob
        @iconito = '<i style="color: red" class="fas fa-file-pdf fa-2x"></i>'
        @tituloModal = 'PREVISUALIZAR DOCUMENTO PDF'
        @icono_descarga = '<i class="fas fa-file-pdf"></i>'
        @titulo_btn_download = 'Descargar archivo PDF'
        @class_btn_download = 'btn btn-outline-danger btn-sm'
      elsif tipo_file == 'word'
        @doc = Documento.find(@documento_id)
        @completo = Documento.find(@documento_id)
        valores = var_preview_docs(@doc.file_word, @doc.file_word_preview)
        @docto_for_download = valores[0]
        @docto_for_preview = valores[1]
        @iconito = valores[2]
        @tituloModal = valores[3]
        @icono_descarga = valores[4]
        @titulo_btn_download = valores[5]
        @class_btn_download = valores[6]
      elsif tipo_file == 'excel'
        @doc = Documento.find(@documento_id)
        @completo = Documento.find(@documento_id)
        valores = var_preview_docs(@doc.file_excel, @doc.file_excel_preview)
        @docto_for_download = valores[0]
        @docto_for_preview = valores[1]
        @iconito = valores[2]
        @tituloModal = valores[3]
        @icono_descarga = valores[4]
        @titulo_btn_download = valores[5]
        @class_btn_download = valores[6]
      end
    else
      @seguimiento_id = params[:seguimiento_id]
      if tipo_file == 'pdf'
        @docto_for_download = SeguimientoSolicitud.find(@seguimiento_id).file_seguimiento_pdf.blob
        @docto_for_preview = SeguimientoSolicitud.find(@seguimiento_id).file_seguimiento_pdf.blob
        @iconito = '<i style="color: red" class="fas fa-file-pdf fa-2x"></i>'
        @tituloModal = 'PREVISUALIZAR DOCUMENTO PDF'
        @icono_descarga = '<i class="fas fa-file-pdf"></i>'
        @titulo_btn_download = 'Descargar archivo PDF'
        @class_btn_download = 'btn btn-outline-danger btn-sm'
      else
        if tipo_file == 'word'
          @doc = SeguimientoSolicitud.find(@seguimiento_id)
          valores = var_preview_docs(@doc.file_seguimiento_word, @doc.file_seguimiento_word_preview)
          @docto_for_download = valores[0]
          @docto_for_preview = valores[1]
          @iconito = valores[2]
          @tituloModal = valores[3]
          @icono_descarga = valores[4]
          @titulo_btn_download = valores[5]
          @class_btn_download = valores[6]
        end
      end
    end



    respond_to do |format|
      format.html
      format.js
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documento_params
      params.require(:documento).permit(:codigo, :correlativo, :nombre, :fecha_vigencia, :version, :descripcion, :empresa_id, :estado_documento_id, :user_created_id, :user_updated_id, :estado, :proceso_id, :tipo_sistema_id, :tipo_documento_id, :file_pdf, :file_word, :file_excel)
    end
end
