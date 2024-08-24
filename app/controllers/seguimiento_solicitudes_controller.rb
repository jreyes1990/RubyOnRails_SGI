class SeguimientoSolicitudesController < ApplicationController
  before_action :set_seguimiento_solicitud, only: %i[ show edit update destroy ]

  # GET /seguimiento_solicitudes or /seguimiento_solicitudes.json
  def index
    @seguimiento_solicitudes = SeguimientoSolicitud.where(:estado => 'I', :estado_documento_id => 1).order(id: :DESC)
  end

  # GET /seguimiento_solicitudes/1 or /seguimiento_solicitudes/1.json
  def show
  end

  # GET /seguimiento_solicitudes/new
  def new
    @solicitud_cambio_id = params[:id]
    @solicitud_cambio = SolicitudCambio.find(@solicitud_cambio_id)
    @seguimiento_solicitud = SeguimientoSolicitud.new
  end

  # GET /seguimiento_solicitudes/1/edit
  def edit
    @solicitud_cambio = SolicitudCambio.find(@seguimiento_solicitud.solicitud_cambio_id)
  end

  # POST /seguimiento_solicitudes or /seguimiento_solicitudes.json
  def create
    @seguimiento_solicitud = SeguimientoSolicitud.new(seguimiento_solicitud_params)
    @seguimiento_solicitud.estado = "A"
    @seguimiento_solicitud.user_created_id = current_user.id
    @parametro_word_seguimiento = params[:seguimiento_solicitud][:file_seguimiento_word]
    @parametro_excel_seguimiento = params[:seguimiento_solicitud][:file_seguimiento_excel]

    respond_to do |format|
      if @seguimiento_solicitud.save
        genera_bitacora("SEGUIMIENTO_SOLICITUD",nil,nil,nil,@seguimiento_solicitud.fecha_vigencia,@seguimiento_solicitud.version,
                        @seguimiento_solicitud.descripcion,@seguimiento_solicitud.estado,@seguimiento_solicitud.user_created_id,@seguimiento_solicitud.user_updated_id,
                        nil,nil,nil,nil,nil,@seguimiento_solicitud.estado_documento_id,
                        nil,@seguimiento_solicitud.solicitud_cambio_id,@seguimiento_solicitud.id,@seguimiento_solicitud.fecha_seguimiento)

        if !@parametro_word_seguimiento.nil?
          #GENERAR VERSION PARA WORD PREVIEW
          @file_cargado = @seguimiento_solicitud.file_seguimiento_word
          crear_docto_to_preview(@file_cargado, @seguimiento_solicitud.file_seguimiento_word_preview)
        end

        if !@parametro_excel_seguimiento.nil?
          #GENERAR VERSION PARA EXCEL PREVIEW
          @file_cargado = @seguimiento_solicitud.file_seguimiento_excel
          crear_docto_to_preview(@file_cargado, @seguimiento_solicitud.file_seguimiento_excel_preview)
        end

        if @seguimiento_solicitud.estado_documento_id == 1
          @solitud = SolicitudCambio.find(@seguimiento_solicitud.solicitud_cambio_id)
          @documento = Documento.find(@solitud.documento_id).update(:version => @seguimiento_solicitud.version, :fecha_vigencia => @seguimiento_solicitud.fecha_vigencia, :file_pdf => @seguimiento_solicitud.file_seguimiento_pdf.blob, :file_word => @seguimiento_solicitud.file_seguimiento_word.blob, :file_word_preview => @seguimiento_solicitud.file_seguimiento_word_preview.blob, :file_excel => @seguimiento_solicitud.file_seguimiento_excel, :file_excel_preview => @seguimiento_solicitud.file_seguimiento_excel_preview)
        end

        format.html { redirect_to solicitud_cambios_path, notice: "El seguimiento # #{@seguimiento_solicitud.id} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @seguimiento_solicitud }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @seguimiento_solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seguimiento_solicitudes/1 or /seguimiento_solicitudes/1.json
  def update
    @seguimiento_solicitud.user_updated_id = current_user.id
    @parametro_word_seguimiento = params[:seguimiento_solicitud][:file_seguimiento_word]
    @parametro_excel_seguimiento = params[:seguimiento_solicitud][:file_seguimiento_excel]

    respond_to do |format|
      if @seguimiento_solicitud.update(seguimiento_solicitud_params)

        if !@parametro_word_seguimiento.nil?
          #GENERAR VERSION PARA WORD PREVIEW
          @file_cargado = @seguimiento_solicitud.file_seguimiento_word
          crear_docto_to_preview(@file_cargado, @seguimiento_solicitud.file_seguimiento_word_preview)
        end

        if !@parametro_excel_seguimiento.nil?
          #GENERAR VERSION PARA EXCEL PREVIEW
          @file_cargado = @seguimiento_solicitud.file_seguimiento_excel
          crear_docto_to_preview(@file_cargado, @seguimiento_solicitud.file_seguimiento_excel_preview)
        end

        genera_bitacora("SEGUIMIENTO_SOLICITUD",nil,nil,nil,@seguimiento_solicitud.fecha_vigencia,@seguimiento_solicitud.version,
                        @seguimiento_solicitud.descripcion,@seguimiento_solicitud.estado,@seguimiento_solicitud.user_created_id,@seguimiento_solicitud.user_updated_id,
                        nil,nil,nil,nil,nil,@seguimiento_solicitud.estado_documento_id,
                        nil,@seguimiento_solicitud.solicitud_cambio_id,@seguimiento_solicitud.id,@seguimiento_solicitud.fecha_seguimiento)

        format.html { redirect_to seguimiento_solicitudes_url(@seguimiento_solicitud), notice: "El seguimiento # #{@seguimiento_solicitud.id} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @seguimiento_solicitud }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @seguimiento_solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguimiento_solicitudes/1 or /seguimiento_solicitudes/1.json
  def destroy
    @seguimiento_solicitud.destroy

    respond_to do |format|
      format.html { redirect_to seguimiento_solicitudes_url, notice: "El seguimiento # #{@seguimiento_solicitud.id} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Seguimiento Solicitud
  def inactivar_seguimiento_solicitud
    @seguimiento_solicitud = SeguimientoSolicitud.find(params[:id])
    @seguimiento_solicitud.user_updated_id = current_user.id
    @seguimiento_solicitud.estado = "I"

    respond_to do |format|
      if @seguimiento_solicitud.save
        format.html { redirect_to seguimiento_solicitudes_url, notice: "El seguimiento solicitud ha sido Inactivado" }
        format.json { render :show, status: :created, location: @seguimiento_solicitud }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar el Seguimiento Solicitud, Verifique!!.." }
        format.json { render json: @seguimiento_solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_preview_file_seg
    @seguimiento_id = params[:id]
    tipo_file = params[:tipo_file]

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
        @seg = SeguimientoSolicitud.find(@seguimiento_id)
        valores = var_preview_docs(@seg.file_seguimiento_word, @seg.file_seguimiento_word_preview)
        @docto_for_download = valores[0]
        @docto_for_preview = valores[1]
        @iconito = valores[2]
        @tituloModal = valores[3]
        @icono_descarga = valores[4]
        @titulo_btn_download = valores[5]
        @class_btn_download = valores[6]
      end
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seguimiento_solicitud
      @seguimiento_solicitud = SeguimientoSolicitud.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seguimiento_solicitud_params
      params.require(:seguimiento_solicitud).permit(:fecha_seguimiento, :version, :fecha_vigencia, :descripcion, :estado_documento_id, :etapa_seguimiento_id, :user_created_id, :user_updated_id, :estado, :solicitud_cambio_id, :file_seguimiento_pdf, :file_seguimiento_word, :file_seguimiento_excel)
    end
end
