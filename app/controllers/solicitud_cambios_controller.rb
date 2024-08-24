class SolicitudCambiosController < ApplicationController
  before_action :set_solicitud_cambio, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /solicitud_cambios or /solicitud_cambios.json
  def index
    @solicitud_cambios = SolicitudCambio.where(:estado => 'A').order(id: :DESC)
  end

  # GET /solicitud_cambios/1 or /solicitud_cambios/1.json
  def show
  end

  # GET /solicitud_cambios/new
  def new
    @documento_id = params[:id]
    @documento_solicitud = Documento.find(@documento_id)
    @solicitud_cambio = SolicitudCambio.new
  end

  # GET /solicitud_cambios/1/edit
  def edit
    @documento_solicitud = Documento.find(@solicitud_cambio.documento_id)
  end

  # POST /solicitud_cambios or /solicitud_cambios.json
  def create
    @solicitud_cambio = SolicitudCambio.new(solicitud_cambio_params)
    @solicitud_cambio.estado = "A"
    @solicitud_cambio.user_created_id = current_user.id
    @solicitud_cambio.estado_documento_id = 2
    @parametro_solicitud = params[:solicitud_cambio][:file_solicitud]

    respond_to do |format|
      if @solicitud_cambio.save
        genera_bitacora("SOLICITUD_CAMBIO", nil, nil, nil, @solicitud_cambio.fecha_solicitud, nil, @solicitud_cambio.descripcion, @solicitud_cambio.estado, @solicitud_cambio.user_created_id, nil,
                        nil, nil, nil, @solicitud_cambio.documento_id, nil, @solicitud_cambio.estado_documento_id, nil, @solicitud_cambio.id, nil, nil)

        if !@parametro_solicitud.nil?
          #GENERAR VERSION PARA WORD PREVIEW
            if @solicitud_cambio.file_solicitud.content_type != 'application/pdf'
              @file_cargado = @solicitud_cambio.file_solicitud
              crear_docto_to_preview(@file_cargado, @solicitud_cambio.file_solicitud_word_preview)
            end
        end

        format.html { redirect_to solicitud_cambios_path, notice: "La solicitud #{@solicitud_cambio.id} del codigo #{@solicitud_cambio.documento.codigo}#{@solicitud_cambio.documento.correlativo} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @solicitud_cambio }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear la solicitud, Verifique!!.." }
        format.json { render json: @solicitud_cambio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitud_cambios/1 or /solicitud_cambios/1.json
  def update
    @solicitud_cambio.user_updated_id = current_user.id
    @solicitud_cambio.estado_documento_id = 2
    @parametro_solicitud = params[:solicitud_cambio][:file_solicitud]

    respond_to do |format|
      if @solicitud_cambio.update(solicitud_cambio_params)

        if !@parametro_solicitud.nil?
          #GENERAR VERSION PARA WORD PREVIEW
          if @solicitud_cambio.file_solicitud.content_type != 'application/pdf'
            @file_cargado = @solicitud_cambio.file_solicitud
            crear_docto_to_preview(@file_cargado, @solicitud_cambio.file_solicitud_word_preview)
          end
        end

        genera_bitacora("SOLICITUD_CAMBIO", nil, nil, nil, @solicitud_cambio.fecha_solicitud, nil, @solicitud_cambio.descripcion, @solicitud_cambio.estado, @solicitud_cambio.user_created_id, @solicitud_cambio.user_updated_id,
                        nil, nil, nil, @solicitud_cambio.documento_id, nil, @solicitud_cambio.estado_documento_id, nil, @solicitud_cambio.id, nil, nil)

        format.html { redirect_to solicitud_cambios_url(@solicitud_cambio), notice: "La solicitud #{@solicitud_cambio.id} del codigo #{@solicitud_cambio.documento.codigo}#{@solicitud_cambio.documento.correlativo} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @solicitud_cambio }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar la solicitud, Verifique!!.." }
        format.json { render json: @solicitud_cambio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitud_cambios/1 or /solicitud_cambios/1.json
  def destroy
    @solicitud_cambio.destroy

    respond_to do |format|
      format.html { redirect_to solicitud_cambios_url, notice: "La solicitud #{@solicitud_cambio.id} del codigo #{@solicitud_cambio.documento.codigo}#{@solicitud_cambio.documento.correlativo} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Documento
  def inactivar_solicitud_cambio
    @solicitud_cambio = SolicitudCambio.find(params[:id])
    @solicitud_cambio.user_updated_id = current_user.id
    @solicitud_cambio.estado = "I"

    respond_to do |format|
      if @solicitud_cambio.save
        format.html { redirect_to solicitud_cambios_url, notice: "La solicitud #{@solicitud_cambio.id} del codigo #{@solicitud_cambio.documento.codigo}#{@solicitud_cambio.documento.correlativo} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @solicitud_cambio }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar la Solicitud, Verifique!!.." }
        format.json { render json: @solicitud_cambio.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_preview_file_solic
    @solicitud_id = params[:id]

    @solicitud_cambio = SolicitudCambio.find(@solicitud_id)

    valores = var_preview_docs(@solicitud_cambio.file_solicitud, @solicitud_cambio.file_solicitud_word_preview)

    @docto_for_download = valores[0]
    @docto_for_preview = valores[1]
    @iconito = valores[2]
    @tituloModal = valores[3]
    @icono_descarga = valores[4]
    @titulo_btn_download = valores[5]
    @class_btn_download = valores[6]
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud_cambio
      @solicitud_cambio = SolicitudCambio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def solicitud_cambio_params
      params.require(:solicitud_cambio).permit(:fecha_solicitud, :descripcion, :estado_documento_id, :etapa_solicitud_id, :user_created_id, :user_updated_id, :estado, :documento_id, :file_solicitud)
    end
end
