class EtapaDocumentosController < ApplicationController
  before_action :set_etapa_documento, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /etapa_documentos or /etapa_documentos.json
  def index
    @etapa_documentos = EtapaDocumento.order("id DESC")
  end

  # GET /etapa_documentos/1 or /etapa_documentos/1.json
  def show
  end

  # GET /etapa_documentos/new
  def new
    @etapa_documento = EtapaDocumento.new
  end

  # GET /etapa_documentos/1/edit
  def edit
  end

  # POST /etapa_documentos or /etapa_documentos.json
  def create
    @etapa_documento = EtapaDocumento.new(etapa_documento_params)
    @etapa_documento.estado = "A"
    @etapa_documento.user_created_id = current_user.id

    respond_to do |format|
      if @etapa_documento.save
        format.html { redirect_to etapa_documentos_url(@etapa_documento), notice: "Etapa Documento #{@etapa_documento.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @etapa_documento }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear la Etapa Documento, Verifique!!.." }
        format.json { render json: @etapa_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etapa_documentos/1 or /etapa_documentos/1.json
  def update
    @etapa_documento.user_updated_id = current_user.id

    respond_to do |format|
      if @etapa_documento.update(etapa_documento_params)
        format.html { redirect_to etapa_documentos_url(@etapa_documento), notice: "Etapa Documento #{@etapa_documento.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @etapa_documento }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar la Etapa Documento, Verifique!!.." }
        format.json { render json: @etapa_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etapa_documentos/1 or /etapa_documentos/1.json
  def destroy
    @etapa_documento.destroy

    respond_to do |format|
      format.html { redirect_to etapa_documentos_url, notice: "Etapa Documento #{@etapa_documento.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Etapa Documento
  def inactivar_etapa_documento
    @etapa_documento = EtapaDocumento.find(params[:id])
    @etapa_documento.user_updated_id = current_user.id
    @etapa_documento.estado = "I"

    respond_to do |format|
      if @etapa_documento.save
        format.html { redirect_to etapa_documentos_url, notice: "Etapa Documento #{@etapa_documento.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @etapa_documento }
      else
        format.html { redirect_to etapa_documentos_url, alert: "Ocurrio un error al inactivar Etapa Documento, Verifique!!.." }
        format.json { render json: @etapa_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_etapa_documento
    @etapa_documento = EtapaDocumento.find(params[:id])
    @etapa_documento.user_updated_id = current_user.id
    @etapa_documento.estado = "A"

    respond_to do |format|
      if @etapa_documento.save
        format.html { redirect_to etapa_documentos_url, notice: "Etapa Documento #{@etapa_documento.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @etapa_documento }
      else
        format.html { redirect_to etapa_documentos_url, alert: "Ocurrio un error al activar Etapa Documento, Verifique!!.." }
        format.json { render json: @etapa_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etapa_documento
      @etapa_documento = EtapaDocumento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def etapa_documento_params
      params.require(:etapa_documento).permit(:nombre, :descripcion, :user_created_id, :user_updated_id, :estado)
    end
end
