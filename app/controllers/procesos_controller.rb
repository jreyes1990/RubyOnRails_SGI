class ProcesosController < ApplicationController
  before_action :set_proceso, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /procesos or /procesos.json
  def index
    @procesos = Proceso.where("estado is not null").order("id DESC")
  end

  # GET /procesos/1 or /procesos/1.json
  def show
  end

  # GET /procesos/new
  def new
    @proceso = Proceso.new
  end

  # GET /procesos/1/edit
  def edit
  end

  # POST /procesos or /procesos.json
  def create
    @proceso = Proceso.new(proceso_params)
    @proceso.estado = "A"
    @proceso.user_created_id = current_user.id
    @proceso.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @proceso.save
        format.html { redirect_to procesos_url(@proceso), notice: "Proceso #{@proceso.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @proceso }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el Proceso, Verifique!!.." }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procesos/1 or /procesos/1.json
  def update
    @proceso.user_updated_id = current_user.id

    respond_to do |format|
      if @proceso.update(proceso_params)
        format.html { redirect_to procesos_url(@proceso), notice: "Proceso #{@proceso.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @proceso }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el Proceso, Verifique!!.." }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procesos/1 or /procesos/1.json
  def destroy
    @proceso.destroy

    respond_to do |format|
      format.html { redirect_to procesos_url, notice: "Proceso #{@proceso.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Proceso
  def inactivar_proceso
    @proceso = Proceso.find(params[:id])
    @proceso.user_updated_id = current_user.id
    @proceso.estado = "I"

    respond_to do |format|
      if @proceso.save
        format.html { redirect_to procesos_url, notice: "Proceso #{@proceso.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @proceso }
      else
        format.html { redirect_to procesos_url, alert: "Ocurrio un error al inactivar Proceso, Verifique!!.." }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_proceso
    @proceso = Proceso.find(params[:id])
    @proceso.user_updated_id = current_user.id
    @proceso.estado = "A"

    respond_to do |format|
      if @proceso.save
        format.html { redirect_to procesos_url, notice: "Proceso #{@proceso.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @proceso }
      else
        format.html { redirect_to procesos_url, alert: "Ocurrio un error al activar Proceso, Verifique!!.." }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceso
      @proceso = Proceso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proceso_params
      params.require(:proceso).permit(:nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado, :macro_proceso_id, :tipo_proceso_id)
    end
end
