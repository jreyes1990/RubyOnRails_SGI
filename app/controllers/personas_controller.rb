class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
  #before_action :comprobar_permiso
 
  def show
      @empresa = Empresa.joins("inner join areas on empresas.id = areas.empresa_id
                                inner join personas_areas on personas_areas.area_id = areas.id
                                inner join personas on personas_areas.persona_id = personas.id
                                WHERE
                                personas.id = #{@persona.id}
                                and areas.empresa_id = #{current_user_empresa_id}").first

      @areas = Area.joins(" inner join empresas on empresas.id = areas.empresa_id
                            inner join personas_areas on personas_areas.area_id = areas.id
                            inner join personas on personas_areas.persona_id = personas.id
                            WHERE
                            personas.id = #{@persona.id}
                            and areas.empresa_id = #{current_user_empresa_id}").all

      @nombresAreas = ""

      @areas.each do |a|

        if @areas.count == 1
        @nombresAreas = @nombresAreas + a.nombre
        elsif @nombresAreas == ""
        @nombresAreas = @nombresAreas + a.nombre + ','
        else
        @nombresAreas = @nombresAreas+ ', ' + a.nombre 
        end
        @nombresAreas.sub!(',,', ',')

        end 
      end

  def edit
  end
  
  #Proceso para actualizar una persona
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Persona modficada' }
        format.json { render :show, status: :ok, location: @persona }
      
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
        
      end
    end
  end

  #Proceso para inactivar una persona
  def inactivar
      @personas = Persona.find(params[:id])
      @personas.user_updated_id = current_user.id
      @personas.estado = "I"
      
      respond_to do |format|
        if @personas.save
            @usuario = User.find(@personas.user_id)
            
            @usuario.estado = "I"
            @usuario.user_updated_id = current_user.id
            if @usuario.save
              format.html { redirect_to usuarios_index_path, notice: "Persona y Usuario Inctivado" }
              format.json { render :show, status: :created, location: @personas }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @personas.errors, status: :unprocessable_entity }
            end

        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @personas.errors, status: :unprocessable_entity }
        end
      end
  end

  def activar
    @personas = Persona.find(params[:id])
    @personas.user_updated_id = current_user.id
    @personas.estado = "A"

    respond_to do |format|
      if @personas.save
        @usuario = User.find(@personas.user_id)

        @usuario.estado = "A"
        @usuario.user_updated_id = current_user.id
        if @usuario.save
          format.html { redirect_to usuarios_index_path, notice: "Persona y Usuario Activado" }
          format.json { render :show, status: :created, location: @personas }
        else
          format.html { redirect_to usuarios_index_path, alert: "Ocurrio un error al Activar la Persona y Usuario, Verifique!!..." }
          format.json { render json: @personas.errors, status: :unprocessable_entity }
        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personas.errors, status: :unprocessable_entity }
      end
    end
  end

  def mantener_password
    @personas = Persona.find(params[:id])
    @personas.user_updated_id = current_user.id

    respond_to do |format|
      if @personas.save
        @usuario = User.find(@personas.user_id)
        @usuario.password_changed = 't' || true
        @usuario.user_updated_id = current_user.id

        if @usuario.save
          format.html { redirect_to usuarios_index_path, notice: "Se ha restablecido a las credenciales actuales" }
          format.json { render :show, status: :created, location: @personas }
        else
          format.html { redirect_to usuarios_index_path, alert: "Ocurrio un error al mantener las credenciales, Verifique!!..." }
          format.json { render json: @personas.errors, status: :unprocessable_entity }
        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personas.errors, status: :unprocessable_entity }
      end
    end
  end

  def remitente_email
    @personas = Persona.find(params[:id])
    @usuario = User.find(@personas.user_id)
    @usuario.password = generate_temp_password
    @usuario.user_updated_id = current_user.id
    @nombre_completo = @personas.nombre + " " + @personas.apellido
    @bandera_estado_password = params[:flag_cambio_password].to_i

    if @bandera_estado_password == 1
      puts "EL USUARIO YA CAMBIO LA CONTRASEÑA #{@bandera_estado_password}"
      @usuario.password_changed = "f" || false
    else
      puts "EL USUARIO ESTA PENDIENTE DE CAMBIAR LA CONTRASEÑA #{@bandera_estado_password}"
    end

    respond_to do |format|
      if @usuario.save
        # Envío de correo electrónico
        UserMailer.remitente_exitoso(@nombre_completo, @usuario.password, @usuario.email).deliver_now
        format.html { redirect_to usuarios_index_path, notice: "Las credenciales del usuario #{@nombre_completo} se ha enviado exitosamente" }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { redirect_to usuarios_index_path, alert: "Ocurrio un error al Activar la Persona y Usuario, Verifique!!..." }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

    def modal_cambiar_contrasena
      @persona_id = params[:persona_id]

      respond_to do |format|
        format.html
        format.js
      end
    end 

    def registrar_cambio_contrasena   
      contrasena_nueva = params[:cambio_contrasena_form][:password_nueva]
      confirma_contrasena = params[:cambio_contrasena_form][:password_confirmada]
      @user = User.find(current_user.id)        

      respond_to do |format|
          if contrasena_nueva == confirma_contrasena     
            contrasena_nueva_encriptada = BCrypt::Password.create(contrasena_nueva)     
              @user.encrypted_password = contrasena_nueva_encriptada
              
              if @user.save
                format.html { redirect_to persona_path(current_user.persona), notice: "Contraseña actualizada correctamente." }
                format.json { render :show, status: :created, location: @user }
              else 
                format.html { redirect_to persona_path(current_user.persona), alert: "Error al actualizar la contraseña." }
                format.json { render :show, status: :created, location: @user }
              end 
          else 
            format.html { redirect_to persona_path(current_user.persona), alert: "Las nueva contraseña y la confirmación no coinciden, intente de nuevo." }
            format.json { render :show, status: :created, location: @user }            
          end 
      end 
    end 
  
    def generate_token
      loop do
          token = SecureRandom.hex
          return token unless Persona.exists?({token: token})
      end
    end

    def registrar_token_persona
      
      validacion = params[:validacion]
      persona = Persona.find(params[:persona_id])
          if validacion == "ACTIVAR" 
            token = generate_token         
            persona.token = token
          else validacion == "DESACTIVAR"
            persona.token = ""
          end 

        respond_to do |format|              
          if persona.save
            genera_bitacora_movil("GESTION_TOKEN", params[:persona_id], "" , "SE PROCEDE A #{validacion}, TOKEN PARA APLICACIÓN MÓVIL", token)
            format.html { redirect_to persona_path(current_user.persona), notice: "Token para Aplicación Móvil Actualizado correctamente." }
            format.json { render :show, status: :created, location: persona }
          else
            format.html { redirect_to persona_path(current_user.persona), notice: "Error al generar token para aplicación Móvil." }
            format.json { render :show, status: :created, location: persona }
        end 
      end 
    end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:foto, :nombre, :apellido, :direccion, :telefono, :user_updated_id)
    end

    def generate_temp_password(length = 8)
      chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + %w(! @ # $ % & *)
      password = Array.new(length) { chars.sample }.join
      password
    end
end
