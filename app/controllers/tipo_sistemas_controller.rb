class TipoSistemasController < ApplicationController
  before_action :set_tipo_sistema, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /tipo_sistemas or /tipo_sistemas.json
  def index
    @tipo_sistemas = TipoSistema.where("estado is not null").order("id DESC")
  end

  # GET /tipo_sistemas/1 or /tipo_sistemas/1.json
  def show
  end

  # GET /tipo_sistemas/new
  def new
    @tipo_sistema = TipoSistema.new
  end

  # GET /tipo_sistemas/1/edit
  def edit
  end

  # POST /tipo_sistemas or /tipo_sistemas.json
  def create
    @tipo_sistema = TipoSistema.new(tipo_sistema_params)
    @tipo_sistema.estado = "A"
    @tipo_sistema.user_created_id = current_user.id
    @tipo_sistema.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @tipo_sistema.save
        format.html { redirect_to tipo_sistemas_url(@tipo_sistema), notice: "El sistema #{@tipo_sistema.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @tipo_sistema }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el tipo sistema, Verifique!!.." }
        format.json { render json: @tipo_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_sistemas/1 or /tipo_sistemas/1.json
  def update
    @tipo_sistema.user_updated_id = current_user.id

    respond_to do |format|
      if @tipo_sistema.update(tipo_sistema_params)
        format.html { redirect_to tipo_sistemas_url(@tipo_sistema), notice: "El sistema #{@tipo_sistema.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @tipo_sistema }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el tipo sistema, Verifique!!.." }
        format.json { render json: @tipo_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_sistemas/1 or /tipo_sistemas/1.json
  def destroy
    @tipo_sistema.destroy

    respond_to do |format|
      format.html { redirect_to tipo_sistemas_url, notice: "El sistema #{@tipo_sistema.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar tipo sistema
  def inactivar_tipo_sistema
    @tipo_sistema = TipoSistema.find(params[:id])
    @tipo_sistema.user_updated_id = current_user.id
    @tipo_sistema.estado = "I"

    respond_to do |format|
      if @tipo_sistema.save
        format.html { redirect_to tipo_sistemas_url, notice: "El Sistema #{@tipo_sistema.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @tipo_sistema }
      else
        format.html { redirect_to tipo_sistemas_url, alert: "Ocurrio un error al inactivar el sistema, Verifique!!.." }
        format.json { render json: @tipo_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_tipo_sistema
    @tipo_sistema = TipoSistema.find(params[:id])
    @tipo_sistema.user_updated_id = current_user.id
    @tipo_sistema.estado = "A"

    respond_to do |format|
      if @tipo_sistema.save
        format.html { redirect_to tipo_sistemas_url, notice: "El Sistema #{@tipo_sistema.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @tipo_sistema }
      else
        format.html { redirect_to tipo_sistemas_url, alert: "Ocurrio un error al activar el sistema, Verifique!!.." }
        format.json { render json: @tipo_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_sistema
      @tipo_sistema = TipoSistema.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_sistema_params
      params.require(:tipo_sistema).permit(:nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado)
    end
end
