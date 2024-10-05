class OpcionesController < ApplicationController
  before_action :set_opcion, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /opciones or /opciones.json
  def index
    @opciones = Opcion.includes(:menu, :sub_opcion).order("id DESC")
  end

  # GET /opciones/1 or /opciones/1.json
  def show
  end

  # GET /opciones/new
  def new
    @opcion = Opcion.new
  end

  # GET /opciones/1/edit
  def edit
  end

  # POST /opciones or /opciones.json
  def create
    @opcion = Opcion.new(opcion_params)
    @opcion.estado = "A"
    @opcion.user_created_id = current_user.id

    respond_to do |format|
      if @opcion.save
        format.html { redirect_to opciones_path, notice: "Opcion Creada" }
        format.json { render :show, status: :created, location: @opcion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opciones/1 or /opciones/1.json
  def update
    @opcion.user_updated_id = current_user.id
    respond_to do |format|
      if @opcion.update(opcion_params)
        format.html { redirect_to opciones_path, notice: "Opcion Actualizada" }
        format.json { render :show, status: :ok, location: @opcion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opciones/1 or /opciones/1.json
  def destroy
    @opcion.destroy
    respond_to do |format|
      format.html { redirect_to opciones_url, notice: "Opcion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

   # Inactivar opciones
 def inactivar_opcion
  @opcion = Opcion.find(params[:id])
  @opcion.user_updated_id = current_user.id
  @opcion.estado = "I"
    respond_to do |format|
      if @opcion.save
        format.html { redirect_to opciones_path, notice: "Opción Inactivada" }
        format.json { render :show, status: :created, location: @opcion }
      else
        format.html { redirect_to opciones_path, alert: "Ocurrio un error al inactivar Opcion, Verifique!!..." }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
 end

  def activar_opcion
    @opcion = Opcion.find(params[:id])
    @opcion.user_updated_id = current_user.id
    @opcion.estado = "A"

    respond_to do |format|
      if @opcion.save
        format.html { redirect_to opciones_path, notice: "Opción Activada" }
        format.json { render :show, status: :created, location: @opcion }
      else
        format.html { redirect_to opciones_path, alert: "Ocurrio un error al activar Opcion, Verifique!!..." }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opcion
      @opcion = Opcion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opcion_params
      params.require(:opcion).permit(:nombre, :descripcion, :icono, :path, :menu_id, :controlador)
    end
end
