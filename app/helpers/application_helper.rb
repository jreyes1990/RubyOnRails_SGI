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


  def is_active_controller_configuracion_titulo()
        @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas", "datos_externos", "detalle_datos_externos", "datos_apis", "clonar_catalogos"]
        if @controladores.include? params[:controller]
            "nav-item active"
        else
           "nav-item"
        end
  end

    def is_active_controller_configuracion()
        @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas", "datos_externos", "detalle_datos_externos", "datos_apis", "clonar_catalogos"]
        if @controladores.include? params[:controller]
            "nav-link"
        else
           "nav-link collapsed"
        end
    end

    def is_active_option_controller_configuracion()
        @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas", "datos_externos", "detalle_datos_externos", "datos_apis", "clonar_catalogos"]
        if @controladores.include? params[:controller]
         "collapse show"
        else
           "collapse"
        end
    end

    def is_active_controller_catalogos_titulo()
        @controladores = ["tipo_usuarios","tipo_procesos","tipo_sistemas","tipo_documentos","macro_procesos","etapa_documentos","etapa_solicitudes","estado_documentos","procesos","actividades","permiso_documentos","permiso_documento_usuarios"]
        if @controladores.include? params[:controller]
            "nav-item active"
        else
           "nav-item"
        end
    end

    def is_active_controller_catalogos()
        @controladores = ["tipo_usuarios","tipo_procesos","tipo_sistemas","tipo_documentos","macro_procesos","etapa_documentos","etapa_solicitudes","estado_documentos","procesos","actividades","permiso_documentos","permiso_documento_usuarios"]
        if @controladores.include? params[:controller]
            "nav-link"
        else
           "nav-link collapsed"
        end
    end

    def is_active_option_controller_catalogos()
        @controladores = ["tipo_usuarios","tipo_procesos","tipo_sistemas","tipo_documentos","macro_procesos","etapa_documentos","etapa_solicitudes","estado_documentos","procesos","actividades","permiso_documentos","permiso_documento_usuarios"]
        if @controladores.include? params[:controller]
         "collapse show"
        else
           "collapse"
        end
    end

    def is_active_controller_documentos_titulo()
      @controladores = ["documentos","solicitud_cambios"]
      if @controladores.include? params[:controller]
        "nav-item active"
      else
        "nav-item"
      end
    end

    def is_active_controller_documentos()
      @controladores = ["documentos","solicitud_cambios"]
      if @controladores.include? params[:controller]
        "nav-link"
      else
        "nav-link collapsed"
      end
    end

    def is_active_option_controller_documentos()
      @controladores = ["documentos","solicitud_cambios"]
      if @controladores.include? params[:controller]
        "collapse show"
      else
        "collapse"
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

    def is_active_controller_ordenes_titulo()
        @controladores = ["orden_trabajos", "resumen_orden_trabajos"]
        if @controladores.include? params[:controller]
            "nav-item active"
        else
           "nav-item"
        end
    end

    def is_active_controller_ordenes()
        @controladores = ["orden_trabajos", "resumen_orden_trabajos"]
        if @controladores.include? params[:controller]
            "nav-link"
        else
           "nav-link collapsed"
        end
    end

    def is_active_option_controller_ordenes()
        @controladores = ["orden_trabajos", "resumen_orden_trabajos"]
        if @controladores.include? params[:controller]
         "collapse show"
        else
           "collapse"
        end
    end


end


