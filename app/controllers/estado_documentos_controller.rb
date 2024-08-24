class EstadoDocumentosController < ApplicationController
  before_action :set_estado_documento, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /estado_documentos or /estado_documentos.json
  def index
    @estado_documentos = EstadoDocumento.order("id DESC")
  end

  # GET /estado_documentos/1 or /estado_documentos/1.json
  def show
  end

  # GET /estado_documentos/new
  def new
    @estado_documento = EstadoDocumento.new
  end

  # GET /estado_documentos/1/edit
  def edit
  end

  # POST /estado_documentos or /estado_documentos.json
  def create
    @estado_documento = EstadoDocumento.new(estado_documento_params)
    @estado_documento.estado = "A"
    @estado_documento.user_created_id = current_user.id
    @estado_documento.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @estado_documento.save
        format.html { redirect_to estado_documentos_url(@estado_documento), notice: "Estado Documento #{@estado_documento.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @estado_documento }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el Estado Documento, Verifique!!.." }
        format.json { render json: @estado_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_documentos/1 or /estado_documentos/1.json
  def update
    @estado_documento.user_updated_id = current_user.id

    respond_to do |format|
      if @estado_documento.update(estado_documento_params)
        format.html { redirect_to estado_documentos_url(@estado_documento), notice: "Estado Documento #{@estado_documento.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @estado_documento }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el Estado Documento, Verifique!!.." }
        format.json { render json: @estado_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_documentos/1 or /estado_documentos/1.json
  def destroy
    @estado_documento.destroy

    respond_to do |format|
      format.html { redirect_to estado_documentos_url, notice: "Estado Documento #{@estado_documento.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Estado Documento
  def inactivar_estado_documento
    @estado_documento = EstadoDocumento.find(params[:id])
    @estado_documento.user_updated_id = current_user.id
    @estado_documento.estado = "I"

    respond_to do |format|
      if @estado_documento.save
        format.html { redirect_to estado_documentos_url, notice: "Estado Documento #{@estado_documento.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @estado_documento }
      else
        format.html { redirect_to estado_documentos_url, alert: "Ocurrio un error al inactivar Estado Documento, Verifique!!.." }
        format.json { render json: @estado_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_estado_documento
    @estado_documento = EstadoDocumento.find(params[:id])
    @estado_documento.user_updated_id = current_user.id
    @estado_documento.estado = "A"

    respond_to do |format|
      if @estado_documento.save
        format.html { redirect_to estado_documentos_url, notice: "Estado Documento #{@estado_documento.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @estado_documento }
      else
        format.html { redirect_to estado_documentos_url, alert: "Ocurrio un error al activar Estado Documento, Verifique!!.." }
        format.json { render json: @estado_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_documento
      @estado_documento = EstadoDocumento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estado_documento_params
      params.require(:estado_documento).permit(:nombre, :descripcion, :empresa_id, :user_created_id, :user_updated_id, :estado, :etapa_documento_id)
    end
end
