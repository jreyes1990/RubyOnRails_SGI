class TipoProcesosController < ApplicationController
  before_action :set_tipo_proceso, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /tipo_procesos or /tipo_procesos.json
  def index
    @tipo_procesos = TipoProceso.order("id DESC")
  end

  # GET /tipo_procesos/1 or /tipo_procesos/1.json
  def show
  end

  # GET /tipo_procesos/new
  def new
    @tipo_proceso = TipoProceso.new
  end

  # GET /tipo_procesos/1/edit
  def edit
  end

  # POST /tipo_procesos or /tipo_procesos.json
  def create
    @tipo_proceso = TipoProceso.new(tipo_proceso_params)
    @tipo_proceso.estado = "A"
    @tipo_proceso.user_created_id = current_user.id
    @tipo_proceso.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @tipo_proceso.save
        format.html { redirect_to tipo_procesos_url(@tipo_proceso), notice: "Tipo proceso #{@tipo_proceso.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @tipo_proceso }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el tipo proceso, Verifique!!.." }
        format.json { render json: @tipo_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_procesos/1 or /tipo_procesos/1.json
  def update
    @tipo_proceso.user_updated_id = current_user.id

    respond_to do |format|
      if @tipo_proceso.update(tipo_proceso_params)
        format.html { redirect_to tipo_procesos_url(@tipo_proceso), notice: "Tipo proceso #{@tipo_proceso.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @tipo_proceso }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el tipo proceso, Verifique!!.." }
        format.json { render json: @tipo_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_procesos/1 or /tipo_procesos/1.json
  def destroy
    @tipo_proceso.destroy

    respond_to do |format|
      format.html { redirect_to tipo_procesos_url, notice: "Tipo proceso #{@tipo_proceso.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar tipo proceso
  def inactivar_tipo_proceso
    @tipo_proceso = TipoProceso.find(params[:id])
    @tipo_proceso.user_updated_id = current_user.id
    @tipo_proceso.estado = "I"

    respond_to do |format|
      if @tipo_proceso.save
        format.html { redirect_to tipo_procesos_url, notice: "Tipo Proceso #{@tipo_proceso.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @tipo_proceso }
      else
        format.html { redirect_to tipo_procesos_url, alert: "Ocurrio un error al inactivar el tipo proceso, Verifique!!.." }
        format.json { render json: @tipo_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_tipo_proceso
    @tipo_proceso = TipoProceso.find(params[:id])
    @tipo_proceso.user_updated_id = current_user.id
    @tipo_proceso.estado = "A"

    respond_to do |format|
      if @tipo_proceso.save
        format.html { redirect_to tipo_procesos_url, notice: "Tipo Proceso #{@tipo_proceso.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @tipo_proceso }
      else
        format.html { redirect_to tipo_procesos_url, alert: "Ocurrio un error al activar el tipo proceso, Verifique!!.." }
        format.json { render json: @tipo_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_proceso
      @tipo_proceso = TipoProceso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_proceso_params
      params.require(:tipo_proceso).permit(:nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado)
    end
end
