class AreasController < ApplicationController
  before_action :set_area, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /areas or /areas.json
  def index
    #@areas = Area.all
    @areas = Area.includes(:empresa).order(:id)
  end

  # GET /areas/1 or /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas or /areas.json
  def create
    @area = Area.new(area_params)
    @area.estado = "A"
    @area.user_created_id = current_user.id

    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_path, notice: "Área creada exitosamente." }
        format.json { render :show, status: :created, location: areas_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: areas_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1 or /areas/1.json
  def update
    @area.user_updated_id = current_user.id
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to areas_path, notice: "Área actualizada exitosamente." }
        format.json { render :show, status: :ok, location: area_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: areas_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1 or /areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: "Área Eliminada." }
      format.json { head :no_content }
    end
  end

  # Inactivar area
  def inactivar_area
    @area = Area.find(params[:id])
    @area.user_updated_id = current_user.id
    @area.estado = "I"
    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_path, notice: "Área Inactivada" }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { redirect_to areas_path, alert: "Ocurrio un error al inactivar el Àrea, Verifique!!..." }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_area
    @area = Area.find(params[:id])
    @area.user_updated_id = current_user.id
    @area.estado = "A"

    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_path, notice: "Área Activada" }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { redirect_to areas_path, alert: "Ocurrio un error al activar el Àrea, Verifique!!..." }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_params
      params.require(:area).permit(:nombre, :descripcion, :empresa_id)
    end
end
