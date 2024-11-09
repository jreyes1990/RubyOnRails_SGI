module ApplicationHelper
    include Utilidades
    include Permisos

  #  def current_user_name
   #     persona = Persona.where("user_id = ? ", current_user.id).first
    #    return persona.nombre + " " + persona.apellido
    #end

  def current_user_name
    persona = Persona.where("user_id = ? ", current_user.id).first

    if (persona != nil) then
      if (persona.nombre != nil || persona.apellido != nil )
        return persona.nombre.upcase + " " + persona.apellido.upcase
      else
        return current_user.email
      end
    else
      return current_user.email
    end
  end

  def current_nombre_area_controller
    parametros_area = Parametro.where(:user_id => current_user.id).first

    if (parametros_area != nil) then
      nombre_area = parametros_area.nombre_area.upcase
      return nombre_area
    else
      return nombre_area = ''
    end
  end

  def current_nombre_area_empresa_controller
    parametros_area = Parametro.where(:user_id => current_user.id).first

    if (parametros_area != nil) then
      nombre_area_empresa = parametros_area.nombre_empresa.upcase
      return nombre_area_empresa
    else
      return nombre_area_empresa = ''
    end
  end

  def helper_current_user_empresa_id
    id_empresa_actual = 0
    parametros = Parametro.where(:user_id => current_user.id).first

    if (parametros != nil) then
      id_empresa_actual = parametros.empresa_id
      return id_empresa_actual
    else
      return id_empresa_actual = ''
    end
  end

  def helper_current_area_id_user
    id_area = 0
    @area = Area.joins("inner join personas_areas on personas_areas.area_id = areas.id
        inner join personas on personas.id = personas_areas.persona_id
        inner join empresas on empresas.id = areas.empresa_id
        where personas.user_id = #{current_user.id}").first
        id_area = @area.id
        return id_area
  end

  def helper_current_areas_x_usuario
    id_area = []
    @area = Area.joins("inner join personas_areas on personas_areas.area_id = areas.id
        inner join personas on personas.id = personas_areas.persona_id
        inner join empresas on empresas.id = areas.empresa_id
        where personas.user_id = #{current_user.id}")
        id_area = @area.id
        return id_area
  end

  def current_user_role
    search_params = Parametro.where(user_id: current_user.id).first

    if search_params.present?
      role_persona =  PersonasArea.includes(:rol, persona: [:user], area: [:empresa])
                                .left_joins(:rol, persona: [:user], area: [:empresa])
                                .where(personas_areas: {areas: {empresa_id: search_params.empresa_id}, area_id: search_params.area_id, personas: {user_id: search_params.user_id}}).limit(1).first

      return role_persona&.rol.try(:nombre) || ""
    else
      return ""
    end
  end

  def is_active_action(controller)
    if params[:controller] == controller
      "collapse-item active"
    else
      "collapse-item"
    end
  end

  def is_home_active()
    if params[:controller] == "home"
      "nav-item active"
    else
      "nav-item"
    end
  end

    # METODOS DE ACTIVACION EN SIDEBAR
  def is_active_controller_titulo(controlador)
    @controladores = Array(controlador) # Asegúrate de que controlador sea un array

    if @controladores.include? params[:controller]
      "nav-item active"
    else
      "nav-item"
    end
  end

  def is_active_controller(controlador)
    @controladores = Array(controlador) # Asegúrate de que controlador sea un array

    if @controladores.include? params[:controller]
      "nav-link"
    else
      "nav-link collapsed"
    end
  end

  def is_active_option_controller(controlador)
    @controladores = Array(controlador) # Asegúrate de que controlador sea un array

    if @controladores.include? params[:controller]
      "collapse show"
    else
      "collapse"
    end
  end
end
