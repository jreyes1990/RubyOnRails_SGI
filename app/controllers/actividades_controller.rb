class ActividadesController < ApplicationController
  before_action :set_actividad, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /actividades or /actividades.json
  def index
    @actividades = Actividad.order("id DESC")
  end

  # GET /actividades/1 or /actividades/1.json
  def show
  end

  # GET /actividades/new
  def new
    @actividad = Actividad.new
  end

  # GET /actividades/1/edit
  def edit
  end

  # POST /actividades or /actividades.json
  def create
    @actividad = Actividad.new(actividad_params)
    @actividad.estado = "A"
    @actividad.user_created_id = current_user.id
    @actividad.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @actividad.save
        format.html { redirect_to actividades_url(@actividad), notice: "Actividad #{@actividad.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @actividad }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear la Actividad, Verifique!!.." }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividades/1 or /actividades/1.json
  def update
    @actividad.user_updated_id = current_user.id

    respond_to do |format|
      if @actividad.update(actividad_params)
        format.html { redirect_to actividades_url(@actividad), notice: "Actividad #{@actividad.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @actividad }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar la Actividad, Verifique!!.." }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividades/1 or /actividades/1.json
  def destroy
    @actividad.destroy

    respond_to do |format|
      format.html { redirect_to actividades_url, notice: "Actividad #{@actividad.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Proceso
  def inactivar_actividad
    @actividad = Actividad.find(params[:id])
    @actividad.user_updated_id = current_user.id
    @actividad.estado = "I"

    respond_to do |format|
      if @actividad.save
        format.html { redirect_to actividades_url, notice: "Actividad #{@actividad.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @actividad }
      else
        format.html { redirect_to actividades_url, alert: "Ocurrio un error al inactivar Actividad, Verifique!!.." }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_actividad
    @actividad = Actividad.find(params[:id])
    @actividad.user_updated_id = current_user.id
    @actividad.estado = "A"

    respond_to do |format|
      if @actividad.save
        format.html { redirect_to actividades_url, notice: "Actividad #{@actividad.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @actividad }
      else
        format.html { redirect_to actividades_url, alert: "Ocurrio un error al activar Actividad, Verifique!!.." }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad
      @actividad = Actividad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actividad_params
      params.require(:actividad).permit(:nombre, :descripcion, :empresa_id, :user_created_id, :user_updated_id, :estado, :proceso_id)
    end
end
