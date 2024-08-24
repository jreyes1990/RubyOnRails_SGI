class EtapaSolicitudesController < ApplicationController
  before_action :set_etapa_solicitud, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /etapa_solicitudes or /etapa_solicitudes.json
  def index
    @etapa_solicitudes = EtapaSolicitud.where(:estado => 'A').order("id DESC")
  end

  # GET /etapa_solicitudes/1 or /etapa_solicitudes/1.json
  def show
  end

  # GET /etapa_solicitudes/new
  def new
    @etapa_solicitud = EtapaSolicitud.new
  end

  # GET /etapa_solicitudes/1/edit
  def edit
  end

  # POST /etapa_solicitudes or /etapa_solicitudes.json
  def create
    @etapa_solicitud = EtapaSolicitud.new(etapa_solicitud_params)
    @etapa_solicitud.estado = "A"
    @etapa_solicitud.user_created_id = current_user.id
    @etapa_solicitud.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @etapa_solicitud.save
        format.html { redirect_to etapa_solicitudes_url(@etapa_solicitud), notice: "Etapa Solicitud #{@etapa_solicitud.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @etapa_solicitud }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear la Etapa Solicitud, Verifique!!.." }
        format.json { render json: @etapa_solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etapa_solicitudes/1 or /etapa_solicitudes/1.json
  def update
    @etapa_solicitud.user_updated_id = current_user.id

    respond_to do |format|
      if @etapa_solicitud.update(etapa_solicitud_params)
        format.html { redirect_to etapa_solicitudes_url(@etapa_solicitud), notice: "Etapa Solicitud #{@etapa_solicitud.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @etapa_solicitud }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar la Etapa Solicitud, Verifique!!.." }
        format.json { render json: @etapa_solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etapa_solicitudes/1 or /etapa_solicitudes/1.json
  def destroy
    @etapa_solicitud.destroy

    respond_to do |format|
      format.html { redirect_to etapa_solicitudes_url, notice: "Etapa Solicitud #{@etapa_solicitud.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Etapa Solicitud
  def inactivar_etapa_solicitud
    @etapa_solicitud = EtapaSolicitud.find(params[:id])
    @etapa_solicitud.user_updated_id = current_user.id
    @etapa_solicitud.estado = "I"

    respond_to do |format|
      if @etapa_solicitud.save
        format.html { redirect_to etapa_solicitudes_url, notice: "Etapa Solicitud #{@etapa_solicitud.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @etapa_solicitud }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar Etapa Solicitud, Verifique!!.." }
        format.json { render json: @etapa_solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etapa_solicitud
      @etapa_solicitud = EtapaSolicitud.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def etapa_solicitud_params
      params.require(:etapa_solicitud).permit(:nombre, :descripcion, :empresa_id, :user_created_id, :user_updated_id, :estado)
    end
end
