class MacroProcesosController < ApplicationController
  before_action :set_macro_proceso, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /macro_procesos or /macro_procesos.json
  def index
    @macro_procesos = MacroProceso.order("id DESC")
  end

  # GET /macro_procesos/1 or /macro_procesos/1.json
  def show
  end

  # GET /macro_procesos/new
  def new
    @macro_proceso = MacroProceso.new
  end

  # GET /macro_procesos/1/edit
  def edit
  end

  # POST /macro_procesos or /macro_procesos.json
  def create
    @macro_proceso = MacroProceso.new(macro_proceso_params)
    @macro_proceso.estado = "A"
    @macro_proceso.user_created_id = current_user.id
    @macro_proceso.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @macro_proceso.save
        format.html { redirect_to macro_procesos_url(@macro_proceso), notice: "Macro Proceso #{@macro_proceso.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @macro_proceso }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el Macro Proceso, Verifique!!.." }
        format.json { render json: @macro_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /macro_procesos/1 or /macro_procesos/1.json
  def update
    @macro_proceso.user_updated_id = current_user.id

    respond_to do |format|
      if @macro_proceso.update(macro_proceso_params)
        format.html { redirect_to macro_procesos_url(@macro_proceso), notice: "Macro Proceso #{@macro_proceso.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @macro_proceso }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el Macro Proceso, Verifique!!.." }
        format.json { render json: @macro_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /macro_procesos/1 or /macro_procesos/1.json
  def destroy
    @macro_proceso.destroy

    respond_to do |format|
      format.html { redirect_to macro_procesos_url, notice: "Macro Proceso #{@macro_proceso.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Macro Proceso
  def inactivar_macro_proceso
    @macro_proceso = MacroProceso.find(params[:id])
    @macro_proceso.user_updated_id = current_user.id
    @macro_proceso.estado = "I"

    respond_to do |format|
      if @macro_proceso.save
        format.html { redirect_to macro_procesos_url, notice: "Macro Proceso #{@macro_proceso.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @macro_proceso }
      else
        format.html { redirect_to macro_procesos_url, alert: "Ocurrio un error al inactivar el Macro Proceso, Verifique!!.." }
        format.json { render json: @macro_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_macro_proceso
    @macro_proceso = MacroProceso.find(params[:id])
    @macro_proceso.user_updated_id = current_user.id
    @macro_proceso.estado = "A"

    respond_to do |format|
      if @macro_proceso.save
        format.html { redirect_to macro_procesos_url, notice: "Macro Proceso #{@macro_proceso.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @macro_proceso }
      else
        format.html { redirect_to macro_procesos_url, alert: "Ocurrio un error al activar el Macro Proceso, Verifique!!.." }
        format.json { render json: @macro_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_macro_proceso
      @macro_proceso = MacroProceso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def macro_proceso_params
      params.require(:macro_proceso).permit(:nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado)
    end
end
