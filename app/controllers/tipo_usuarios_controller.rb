class TipoUsuariosController < ApplicationController
  before_action :set_tipo_usuario, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  # GET /tipo_usuarios or /tipo_usuarios.json
  def index
    @tipo_usuarios = TipoUsuario.order("id DESC")
  end

  # GET /tipo_usuarios/1 or /tipo_usuarios/1.json
  def show
  end

  # GET /tipo_usuarios/new
  def new
    @tipo_usuario = TipoUsuario.new
  end

  # GET /tipo_usuarios/1/edit
  def edit
  end

  # POST /tipo_usuarios or /tipo_usuarios.json
  def create
    @tipo_usuario = TipoUsuario.new(tipo_usuario_params)
    @tipo_usuario.estado = "A"
    @tipo_usuario.user_created_id = current_user.id
    @tipo_usuario.empresa_id = current_user_empresa_id

    respond_to do |format|
      if @tipo_usuario.save
        format.html { redirect_to tipo_usuarios_url(@tipo_usuario), notice: "Tipo usuario #{@tipo_usuario.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @tipo_usuario }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el tipo usuario, Verifique!!.." }
        format.json { render json: @tipo_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_usuarios/1 or /tipo_usuarios/1.json
  def update
    @tipo_usuario.user_updated_id = current_user.id

    respond_to do |format|
      if @tipo_usuario.update(tipo_usuario_params)
        format.html { redirect_to tipo_usuarios_url(@tipo_usuario), notice: "Tipo usuario #{@tipo_usuario.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @tipo_usuario }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el tipo usuario, Verifique!!.." }
        format.json { render json: @tipo_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_usuarios/1 or /tipo_usuarios/1.json
  def destroy
    @tipo_usuario.destroy

    respond_to do |format|
      format.html { redirect_to tipo_usuarios_url, notice: "Tipo usuario #{@tipo_usuario.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar tipo usuario
  def inactivar_tipo_usuario
    @tipo_usuario = TipoUsuario.find(params[:id])
    @tipo_usuario.user_updated_id = current_user.id
    @tipo_usuario.estado = "I"

    respond_to do |format|
      if @tipo_usuario.save
        format.html { redirect_to tipo_usuarios_url, notice: "Tipo Usuario #{@tipo_usuario.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @tipo_usuario }
      else
        format.html { redirect_to tipo_usuarios_url, alert: "Ocurrio un error al inactivar el tipo usuario, Verifique!!.." }
        format.json { render json: @tipo_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_tipo_usuario
    @tipo_usuario = TipoUsuario.find(params[:id])
    @tipo_usuario.user_updated_id = current_user.id
    @tipo_usuario.estado = "A"

    respond_to do |format|
      if @tipo_usuario.save
        format.html { redirect_to tipo_usuarios_url, notice: "Tipo Usuario #{@tipo_usuario.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @tipo_usuario }
      else
        format.html { redirect_to tipo_usuarios_url, alert: "Ocurrio un error al activar el tipo usuario, Verifique!!.." }
        format.json { render json: @tipo_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_usuario
      @tipo_usuario = TipoUsuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_usuario_params
      params.require(:tipo_usuario).permit(:nombre, :descripcion, :empresa_id, :user_created_id, :user_updated_id, :estado)
    end
end
