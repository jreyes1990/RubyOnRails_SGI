Rails.application.routes.draw do
  #Manejo de gema Devise
  devise_for :users
  root 'home#index'
  get 'home/index'
  get 'home/mostrar/:id' => "home#mostrar_parametro", as: 'mostrar_parametro'
  post 'home/cambio_password_user' => "home#cambio_password_user", as: 'cambio_password_user'
  get "salir/modal_salir" => "home#modal_salir", as: "modal_salir"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "/admin" do
    resources :persona_empresa_formularios
    get "permisos/" => "persona_empresa_formularios#index_permisos", :as => "permisos"
    post "persona_empresa_formularios/consulta_permisos"
    get "/permisos/search" => "persona_empresa_formularios#search_usuario", as: "search_usuarios"
    get "/permisos/show" => "persona_empresa_formularios#mostrar_permisos", as: "mostrar_permisos"
    get "/permisos/add" => "persona_empresa_formularios#agregar_permiso", as: "agregar_permisos"
    get "/permisos/showadd" => "persona_empresa_formularios#mostrar_agregar_permisos", as: "mostrar_agregar_permisos"
    post "persona_empresa_formularios/guardar_permisos"
    get "/permisos/opc_perfil" => "persona_empresa_formularios#obtener_opciones_por_perfil", as: "obtener_opciones_por_perfil"
    get "/permisos/opc_individual" => "persona_empresa_formularios#obtener_opciones_por_individual", as: "obtener_opciones_por_individual"
    delete "/permisos/remove/:id" => "persona_empresa_formularios#eliminar_permiso", as: "eliminar_permiso"

    #routs datos externos
    get "/detalle/datosexterno/:dato_externo_id" => "datos_externos#index_detalle_datos_externo", as: "index_detalle_datos_externo"
    get "/nuevo/datos_externo/:id" => "datos_externos#nuevo_detalle_dato", as: "nuevo_detalle_dato"
    post "datos_externos/crea_detalle_de"

    #routs datos apis
    get "/detalle/datosapi/:datos_api_id" => "datos_apis#index_detalle_datos_api", as: "index_detalle_datos_api"
    get "/nuevo/datos_api/:id" => "datos_apis#nuevo_detalle_datos_api", as: "nuevo_detalle_datos_api"
    post "datos_apis/registro_detalle_dato_api"
    get "/editar/datos_api/:id" => "datos_apis#editar_detalle_datos_api", as: "editar_detalle_datos_api"
    post "datos_apis/actualizar_detalle_dato_api"
    get "/inactivar/datos_api/:id" => "datos_apis#inactivar_detalle_datos_api", as: "inactivar_detalle_datos_api"


    get "/empresas/search" => "usuarios#search_empresa", as: "search_empresa"
    get "/areas/search" => "usuarios#search_areas", as: "search_areas"
    get "/persona/modal_cambio_contra/:persona_id" => "personas#modal_cambiar_contrasena", as: "modal_cambiar_contrasena"
    post "personas/registrar_cambio_contrasena"
    get "/persona/registrar_token/:persona_id" => "personas#registrar_token_persona", as: "registrar_token_persona"
    get "/persona/generar_token/" => "personas#generar_token", as: "generar_token"

    resources :datos_apis
    resources :detalle_datos_externos
    resources :datos_externos

    #Manejo controller Usuarios
    post 'usuarios/crear_usuario'
    get 'usuarios/index'
    get 'usuarios/agregar_usuario'
    get "search_area_empresa_usuario" => "usuarios#search_area_empresa_usuario", as: "search_area_empresa_usuario"

    #Manejo controller Personas
    resources :personas
    get 'personas/show/:id' => "personas#show", as: 'ver_perfil'
    #get 'personas/edit/:id' => "personas#edit", as: 'edit_persona'
    patch 'personas/update'
    get 'inactivar/:id' => "personas#inactivar", as: 'inactivaruser'
    get 'activar/:id' => "personas#activar", as: 'activaruser'
    get 'mantener_password/:id' => "personas#mantener_password", as: 'mantener_password_usuario'
    get 'remitente_email/:id' => "personas#remitente_email", as: 'remitente_email_usuario'
    #resources :personas , only: [:show, :edit, :update]


    post 'home/registrar_parametro'
    post "home/registrar_area_temporal"

    #Manejo controller empresas
    resources :empresas
    get 'empresa/inactivar/:id' => "empresas#inactivar_empresa", as: 'inactivar_empresa'
    get 'empresa/activar/:id' => "empresas#activar_empresa", as: 'activar_empresa'

    #Manejo controller areas
    resources :areas
    get 'area/inactivar/:id' => "areas#inactivar_area", as: 'inactivar_area'
    get 'area/activar/:id' => "areas#activar_area", as: 'activar_area'

    #Manejo controller rol
    resources :roles
    get 'rol/inactivar/:id' => "roles#inactivar_rol", as: 'inactivar_rol'
    get 'rol/activar/:id' => "roles#activar_rol", as: 'activar_rol'

    #manejo de controller peresonas - areas
    resources :personas_areas
    get 'usuario_area/inactivar/:id' => "personas_areas#inactivar_usuario_area", as: 'inactivar_usuario_area'
    get "personas_areas/search_areas_by_empresa"

    #Manejo de controller menu
    resources :menus
    get 'menu/inactivar/:id' => "menus#inactivar_menu", as: 'inactivar_menu'
    get 'menu/activar/:id' => "menus#activar_menu", as: 'activar_menu'

    #Manejo de controller Opciones
    resources :opciones
    get 'opcion/inactivar/:id' => "opciones#inactivar_opcion", as: 'inactivar_opcion'
    get 'opcion/activar/:id' => "opciones#activar_opcion", as: 'activar_opcion'

    resources :sub_opciones, :path => 'sub_opcion' do
      member do
        get 'i' => "sub_opciones#inactivar", as: 'inactivar'
        get 'a' => "sub_opciones#activar", as: 'activar'
      end
    end

    #Manejo de controller menu por rol
    resources :menu_roles
    get 'menu_rol/inactivar/:id' => "menu_roles#inactivar_menurol", as: 'inactivar_menurol'
    get 'menu_rol/activar/:id' => "menu_roles#activar_menurol", as: 'activar_menurol'

    #Manejo de controller atributo
    resources :atributos
    get 'atributo/inactivar/:id' => "atributos#inactivar_atributo", as: 'inactivar_atributo'
    get 'atributo/activar/:id' => "atributos#activar_atributo", as: 'activar_atributo'

    #Manejo de controller componente
    resources :componentes
    get 'componente/inactivar/:id' => "componentes#inactivar_componente", as: 'inactivar_componente'
    get 'componente/activar/:id' => "componentes#activar_componente", as: 'activar_componente'

    #Manejo de controller opcion componentes - atributos
    resources :opcion_cas
    get 'opcion_ca/inactivar/:id' => "opcion_cas#inactivar_opcion_ca", as: 'inactivar_opcion_ca'

    #Manejo de controller persona, empresa, formularios
    get 'personas/search/' => "persona_empresa_formularios#search", as: 'search'

    #Para buscar las areas por empresa por persona de un usuario
    get '/permisos/searchemp/' => "persona_empresa_formularios#search_areas_persona", as: 'searchemp'
    post 'persona_empresa_formularios/eliminar_seleccionados', to: 'persona_empresa_formularios#eliminar_seleccionados', as: :eliminar_seleccionados_componentes
  end

  scope "/catalogos" do
    #Manejo de controller Tipo Usuario
    resources :tipo_usuarios
    get 'tipo_usuario/inactivar/:id' => "tipo_usuarios#inactivar_tipo_usuario", as: 'inactivar_tipo_usuario'
    get 'tipo_usuario/activar/:id' => "tipo_usuarios#activar_tipo_usuario", as: 'activar_tipo_usuario'

    #Manejo de controller Tipo Proceso
    resources :tipo_procesos
    get 'tipo_proceso/inactivar/:id' => "tipo_procesos#inactivar_tipo_proceso", as: 'inactivar_tipo_proceso'
    get 'tipo_proceso/activar/:id' => "tipo_procesos#activar_tipo_proceso", as: 'activar_tipo_proceso'

    #Manejo de controller Tipo Sistema
    resources :tipo_sistemas
    get 'tipo_sistema/inactivar/:id' => "tipo_sistemas#inactivar_tipo_sistema", as: 'inactivar_tipo_sistema'
    get 'tipo_sistema/activar/:id' => "tipo_sistemas#activar_tipo_sistema", as: 'activar_tipo_sistema'

    #Manejo de controller Tipo Documento
    resources :tipo_documentos
    get 'tipo_documento/inactivar/:id' => "tipo_documentos#inactivar_tipo_documento", as: 'inactivar_tipo_documento'
    get 'tipo_documento/activar/:id' => "tipo_documentos#activar_tipo_documento", as: 'activar_tipo_documento'

    #Manejo de controller Macro Proceso
    resources :macro_procesos
    get 'macro_proceso/inactivar/:id' => "macro_procesos#inactivar_macro_proceso", as: 'inactivar_macro_proceso'
    get 'macro_proceso/activar/:id' => "macro_procesos#activar_macro_proceso", as: 'activar_macro_proceso'

    #Manejo de controller Etapa Solicitud
    resources :etapa_solicitudes
    get 'etapa_solicitud/inactivar/:id' => "etapa_solicitudes#inactivar_etapa_solicitud", as: 'inactivar_etapa_solicitud'

    #Manejo de controller Etapa Documento
    resources :etapa_documentos
    get 'etapa_documento/inactivar/:id' => "etapa_documentos#inactivar_etapa_documento", as: 'inactivar_etapa_documento'
    get 'etapa_documento/activar/:id' => "etapa_documentos#activar_etapa_documento", as: 'activar_etapa_documento'

    #Manejo de controller Estado Documento
    resources :estado_documentos
    get 'estado_documento/inactivar/:id' => "estado_documentos#inactivar_estado_documento", as: 'inactivar_estado_documento'
    get 'estado_documento/activar/:id' => "estado_documentos#activar_estado_documento", as: 'activar_estado_documento'

    #Manejo de controller Proceso
    resources :procesos
    get 'proceso/inactivar/:id' => "procesos#inactivar_proceso", as: 'inactivar_proceso'
    get 'proceso/activar/:id' => "procesos#activar_proceso", as: 'activar_proceso'

    #Manejo de controller Actividad
    resources :actividades
    get 'actividad/inactivar/:id' => "actividades#inactivar_actividad", as: 'inactivar_actividad'
    get 'actividad/activar/:id' => "actividades#activar_actividad", as: 'activar_actividad'

    #Manejo de controller Permiso Documento
    resources :permiso_documentos
    get 'permiso_documento/inactivar/:id' => "permiso_documentos#inactivar_permiso_documento", as: 'inactivar_permiso_documento'
    get 'permiso_documento/activar/:id' => "permiso_documentos#activar_permiso_documento", as: 'activar_permiso_documento'
    get "permiso_documento/set_sistema" => "permiso_documentos#set_sistema", :as => "set_sistema"
    get "permiso_documento/set_proceso" => "permiso_documentos#obtener_procesos_sistema", :as => "obtener_procesos_sistema"
    get "permiso_documento/set_proceso_documento" => "permiso_documentos#set_proceso_documento", :as => "set_proceso_documento"
    get "permiso_documento/set_proceso_tipoDocumento" => "permiso_documentos#obtener_proceso_tipoDocumento", :as => "obtener_proceso_tipoDocumento"
    get "permiso_documento/set_tipoDocumento_documento" => "permiso_documentos#set_tipoDocumento_documento", :as => "set_tipoDocumento_documento"
    post 'permiso_documentos/download_excel_formats'
    put 'inactivar_documentos_permiso', to: 'permiso_documentos#inactivar_permiso_documentos', as: 'inactivar_documentos_permisos'

    #Manejo de controller Permiso Documento Usuario
    resources :permiso_documento_usuarios
    #get 'permiso_documento_usuario/inactivar/:id' => "permiso_documento_usuarios#inactivar_permiso_docto_usuario", as: 'inactivar_permiso_docto_usuario'
    #get 'permiso_documento_usuario/activar/:id' => "permiso_documento_usuarios#activar_permiso_docto_usuario", as: 'activar_permiso_docto_usuario'
    put 'inactivar_documentos_permiso_usuario', to: 'permiso_documento_usuarios#inactivar_documentos', as: 'inactivar_documentos_permiso_usuario'

    get "search_usuario_perm_docto" => "permiso_documento_usuarios#search_usuarios_perm_doctos", :as => "search_usuarios_perm_doctos"
    get "search_usuario_sistema" => "permiso_documento_usuarios#search_usuario_sistema", :as => "search_usuario_sistema"
    get "search_sistema_perm_docto" => "permiso_documento_usuarios#search_sistema_perm_doctos", :as => "search_sistema_perm_doctos"
    get "search_sistema_proceso" => "permiso_documento_usuarios#search_sistema_proceso", :as => "search_sistema_proceso"
    get "search_proceso_perm_docto" => "permiso_documento_usuarios#search_proceso_perm_doctos", :as => "search_proceso_perm_doctos"
    get "search_proceso_tipo_documento" => "permiso_documento_usuarios#search_proceso_tipo_documento", :as => "search_proceso_tipo_documento"
    get "search_tipo_documento_perm_docto" => "permiso_documento_usuarios#search_tipo_documento_perm_doctos", :as => "search_tipo_documento_perm_doctos"
    post 'permiso_documento_usuarios/download_excel_formats'
  end

  scope "/documentacion" do
    #Manejo de controller Documento
    resources :documentos
    get 'documento/inactivar/:id' => "documentos#inactivar_documento", as: 'inactivar_documento'
    get "documento/descripcion" => "documentos#search_descripcion", :as => "search_descripcion"
    get "documento/set_codigo" => "documentos#set_codigo", :as => "set_codigo"
    get "/documento/modal_preview_file/:id" => "documentos#modal_preview_file", as: "modal_preview_file"
    post "/procesofilterDocumento/" => "documentos#filtro_proceso_documento", as: "filtro_proceso_documento"
    post "/deletefilterprocesoDocumento/" => "documentos#borrar_filtro_proceso_documento", as: "borrar_filtro_proceso_documento"

    #Manejo de controller Bitacora-Documento
    resources :bitacora_documentos
    #get 'bitacora_documentos/index', as: 'bitacora_documentos'

    #Manejo de controller Solicitud Cambio
    resources :solicitud_cambios
    get 'solicitud_cambio/new/:id' => "solicitud_cambios#new", as: 'nueva_solicitud_cambio'
    get 'solicitud_cambio/inactivar/:id' => "solicitud_cambios#inactivar_solicitud_cambio", as: 'inactivar_solicitud_cambio'
    get "/solicitud_cambio/modal_preview_file_solic/:id" => "solicitud_cambios#modal_preview_file_solic", as: "modal_preview_file_solic"

    #Manejo de controller Seguimiento Solicitud
    resources :seguimiento_solicitudes
    get 'seguimiento_solicitud/new/:id' => "seguimiento_solicitudes#new", as: 'nueva_seguimiento_solicitud'
    get 'seguimiento_solicitud/inactivar/:id' => "seguimiento_solicitudes#inactivar_seguimiento_solicitud", as: 'inactivar_seguimiento_solicitud'
    get "/seguimiento_solicitud/modal_preview_file_seg/:id" => "seguimiento_solicitudes#modal_preview_file_seg", as: "modal_preview_file_seg"
  end


  namespace "api" do
    namespace "v1" do
      post '/apiauthenticate' => 'login_apps#authenticate'
    end
  end

end
