class MenuRolesController < ApplicationController
  before_action :set_menu_rol, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso
  
  # GET /menu_roles or /menu_roles.json
  def index
    @menu_roles = MenuRol.order(:id)
  end

  # GET /menu_roles/1 or /menu_roles/1.json
  def show
  end

  # GET /menu_roles/new
  def new
    @menu_rol = MenuRol.new
  end

  # GET /menu_roles/1/edit
  def edit
  end

  # POST /menu_roles or /menu_roles.json
  def create
    #@menu_rol = MenuRol.new(menu_rol_params)
    @menu_rol = MenuRol.new
    @menu_rol.rol_id =  params[:menu_rol][:roles_id]
    @menu_rol.opcion_id =  params[:menu_rol][:opciones_id]
    @menu_rol.estado = "A"
    
    @menu_rol.user_created_id = current_user.id
 
    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_path, notice: "Asignación de Menú por Rol creada" }
        format.json { render :show, status: :created, location: @menu_rol }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_roles/1 or /menu_roles/1.json
  def update
    @menu_rol.rol_id =  params[:menu_rol][:roles_id]
    @menu_rol.opcion_id =  params[:menu_rol][:opciones_id]
    @menu_rol.user_updated_id = current_user.id

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_path, notice: "Asignación de Menú por Rol Actualizada" }
        format.json { render :show, status: :ok, location: @menu_rol }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_roles/1 or /menu_roles/1.json
  def destroy
    @menu_rol.destroy
    respond_to do |format|
      format.html { redirect_to menu_roles_url, notice: "Menu rol was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Inactivar area
  def inactivar_menurol
    @menu_rol = MenuRol.find(params[:id])
    @menu_rol.user_updated_id = current_user.id
    @menu_rol.estado = "I"

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_path, notice: "Asignación de Menú por Rol Inactivada" }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { redirect_to menu_roles_path, alert: "Ocurrio un error al inactivar Menú por Rol, Verifique!!..." }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_menurol
    @menu_rol = MenuRol.find(params[:id])
    @menu_rol.user_updated_id = current_user.id
    @menu_rol.estado = "A"

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_path, notice: "Asignación de Menú por Rol Activada" }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { redirect_to menu_roles_path, alert: "Ocurrio un error al activar Menú por Rol, Verifique!!..." }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_rol
      @menu_rol = MenuRol.find(params[:id])
    end
   
    # Only allow a list of trusted parameters through.
    def menu_rol_params
      params.require(:menu_rol).permit(:roles_id, :opciones_id, :menu_padre)
    end
end
