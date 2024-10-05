class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :comprobar_permiso

  def index
    #@personas = Persona.all.order(:id)
    #@personas = Persona.order(:id)
    @personas = Persona.select("personas.*, users.password_changed as cambio_password, users.sign_in_count, users.current_sign_in_at, users.last_sign_in_at, users.current_sign_in_ip, users.last_sign_in_ip").includes(:user).joins(:user).order("personas.id")
  end

  def new
  end

  def agregar_usuario
    @empresa = Empresa.where(:estado =>'A').limit(10)
  end

  def crear_usuario
    @usuario = User.new(usuario_params)
    @usuario.user_created_id = current_user.id
    @usuario.estado = "A"
    @usuario.password = generate_temp_password
    @nombre_completo = params[:usuario_form][:nombre] + " " + params[:usuario_form][:apellido]

    begin
      respond_to do |format|
        if @usuario.save
          @persona = Persona.where("user_id = ?", @usuario.id).first
          if @persona.update(persona_params)
            # Envío de correo electrónico
            UserMailer.registro_exitoso(@nombre_completo, @usuario.password, @usuario.email).deliver_now

            area_id = params[:usuario_form][:area_id]
            @persona_areas = PersonasArea.new
            @persona_areas.persona_id = @persona.id
            @persona_areas.area_id = area_id
            @persona_areas.estado = 'A'
            @persona_areas.user_created_id = current_user.id

            if @persona_areas.save
              format.html { redirect_to usuarios_index_path, notice: 'Usuario creado exitosamente.' }
            else
              flash[:alert] = "No se pudo asignar la persona a una área"
              redirect_to usuarios_index_path
            end
          else
            flash[:alert] = "No se pudo crear la persona"
            redirect_to usuarios_index_path
          end
        else
          flash[:alert] = "No se pudo crear el usuario"
          redirect_to usuarios_index_path

        end
      end
    rescue Exception => e
        puts "Error General: #{e.message}"
    end
  end

  def search_area_empresa_usuario
    if params[:search_empresa_usuario_params].present?
      parametro = params[:search_empresa_usuario_params].upcase

      @empresa =  Empresa.where("(upper(id|| ' ' ||nombre) like upper('%#{parametro}%')) and estado = 'A' ").limit(50).distinct

      respond_to do |format|
        format.json { render json: @empresa.map { |p| { valor_id: p.id, valor_text: p.informacion_empresa } } }
      end
    elsif params[:empresa_usuario_params].present?
      empresa_id = params[:empresa_usuario_params]

      @area =  Area.joins("inner join empresas on (areas.empresa_id = empresas.id)")
                      .where("areas.empresa_id = #{empresa_id} and areas.estado = 'A'").limit(50).distinct

      respond_to do |format|
        format.json {
          render json: {
            area_empresa: @area.map { |p| { valor_id: p.id, valor_text: p.nombre_area_empresa } }
          }
        }
      end
    end
  end

 def set_usuario
  end

  def usuario_params
    params.require(:usuario_form).permit(:email, :password )
  end

  def persona_params
    params.require(:usuario_form).permit(:nombre, :apellido, :telefono, :direccion, :user_created_id, :estado)
  end

  def generate_temp_password(length = 8)
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + %w(! @ # $ % & *)
    password = Array.new(length) { chars.sample }.join
    password
  end
end
