class TipoDocumentosController < ApplicationController
  before_action :set_tipo_documento, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /tipo_documentos or /tipo_documentos.json
  def index
    @tipo_documentos = TipoDocumento.where("estado is not null").order("id DESC")
  end

  # GET /tipo_documentos/1 or /tipo_documentos/1.json
  def show
  end

  # GET /tipo_documentos/new
  def new
    @tipo_documento = TipoDocumento.new
  end

  # GET /tipo_documentos/1/edit
  def edit
  end

  # POST /tipo_documentos or /tipo_documentos.json
  def create
    @tipo_documento = TipoDocumento.new(tipo_documento_params)
    @tipo_documento.estado = "A"
    @tipo_documento.user_created_id = current_user.id
    @tipo_documento.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @tipo_documento.save
        format.html { redirect_to tipo_documentos_url(@tipo_documento), notice: "Tipo Documento #{@tipo_documento.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @tipo_documento }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el tipo documento, Verifique!!.." }
        format.json { render json: @tipo_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_documentos/1 or /tipo_documentos/1.json
  def update
    @tipo_documento.user_updated_id = current_user.id

    respond_to do |format|
      if @tipo_documento.update(tipo_documento_params)
        format.html { redirect_to tipo_documentos_url(@tipo_documento), notice: "Tipo Documento #{@tipo_documento.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @tipo_documento }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el tipo documento, Verifique!!.." }
        format.json { render json: @tipo_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_documentos/1 or /tipo_documentos/1.json
  def destroy
    @tipo_documento.destroy

    respond_to do |format|
      format.html { redirect_to tipo_documentos_url, notice: "Tipo Documento #{@tipo_documento.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar tipo documento
  def inactivar_tipo_documento
    @tipo_documento = TipoDocumento.find(params[:id])
    @tipo_documento.user_updated_id = current_user.id
    @tipo_documento.estado = "I"

    respond_to do |format|
      if @tipo_documento.save
        format.html { redirect_to tipo_documentos_url, notice: "Tipo Documento #{@tipo_documento.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @tipo_documento }
      else
        format.html { redirect_to tipo_documentos_url, alert: "Ocurrio un error al inactivar el tipo documento, Verifique!!.." }
        format.json { render json: @tipo_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_tipo_documento
    @tipo_documento = TipoDocumento.find(params[:id])
    @tipo_documento.user_updated_id = current_user.id
    @tipo_documento.estado = "A"

    respond_to do |format|
      if @tipo_documento.save
        format.html { redirect_to tipo_documentos_url, notice: "Tipo Documento #{@tipo_documento.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @tipo_documento }
      else
        format.html { redirect_to tipo_documentos_url, alert: "Ocurrio un error al activar el tipo documento, Verifique!!.." }
        format.json { render json: @tipo_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_documento
      @tipo_documento = TipoDocumento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_documento_params
      params.require(:tipo_documento).permit(:nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado)
    end
end
