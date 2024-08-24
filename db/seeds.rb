=begin
Actividad.create!([
  {nombre: "Mantenimiento de sistemas de información en producción", descripcion: "Responsable: Soporte.", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", proceso_id: 3, 1},
  {nombre: "Disponibilidad y respaldo de base de datos", descripcion: "Responsable: INFRAESTRUCTURA.", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", proceso_id: 3, 2},
  {nombre: "Mantenimiento de equipo de cómputo y servidores", descripcion: "Responsable: INFRAESTRUCTURA.", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", proceso_id: 3, 3}
])

Area.create!([
  {nombre: "Sistemas de Gestión", descripcion: "Area para agrupar al personal de sistemas de Gestión", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {nombre: "Saludo y Seguridad Ocupacional", descripcion: "SSO", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {nombre: "Tecnología e Información TI", descripcion: "Departamento de TI de la empresa Ingenio Madre Tierra.", empresa_id: 1, user_created_id: nil, user_updated_id: nil, estado: "A", 3}
])

Atributo.create!([
  {nombre: "VER", descripcion: "Atributo que nos brinda la opción de ver.", user_created_id: 1, user_updated_id: 1, estado: "A", 1},
  {nombre: "ACCESAR", descripcion: "Atributo que nos brinda el permiso \r\n de acceso a partes del sistema", user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {nombre: "VER OPCION", descripcion: "Atributo que nos brinda la opción de ver una opción en el Sidebar.", user_created_id: 1, user_updated_id: 1, estado: "A", 3}
])

Componente.create!([
  {nombre: "BOTON NUEVO REGISTRO", descripcion: "Botón para agregar un nuevo registro.", user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {nombre: "BOTON EDITAR REGISTRO", descripcion: "Botón para editar un registro.", user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {nombre: "BOTON ELIMINAR REGISTRO", descripcion: "Botón para la eliminar un registro.", user_created_id: 1, user_updated_id: nil, estado: "A", 3},
  {nombre: "OPCION", descripcion: "Componente para la validación de permisos a nivel de opciones del sistema.", user_created_id: 1, user_updated_id: nil, estado: "A", 4},
  {nombre: "BOTON REGISTRAR", descripcion: "Botón para agregar un nuevo registro.", user_created_id: 1, user_updated_id: nil, estado: "A", 5},
  {nombre: "MENU USUARIOS", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 6},
  {nombre: "MENU ROL", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 7},
  {nombre: "MENU USUARIO AREA", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 8},
  {nombre: "MENU MENU", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 9},
  {nombre: "MENU OPCION MENU", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 10},
  {nombre: "MENU MENU ROL", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 11},
  {nombre: "MENU ATRIBUTO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 12},
  {nombre: "MENU COMPONENTE", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 13},
  {nombre: "MENU PERMISOS FORMULARIO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 14},
  {nombre: "MENU PERMISOS USUARIO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 15},
  {nombre: "MENU EMPRESAS", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 16},
  {nombre: "MENU AREAS EMPRESA", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 17},
])

Empresa.create!([
  {nombre: "Ingenio Madre Tierra", descripcion: "Empresa productora de azúcar y sus derivados", codigo_empresa: 2, user_created_id: nil, user_updated_id: nil, estado: "A", 1},
  {nombre: "Cooperativa Madre Tierra", descripcion: "Coope", codigo_empresa: 411, user_created_id: 1, user_updated_id: nil, estado: "A", 2}
])

Menu.create!([
  {nombre: "Configuración", descripcion: "Menú padre que contendrá las configuraciones del sistema.", icono: "fas fa-fw fa-wrench", user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {nombre: "Catálogos", descripcion: "Menú padre que tendrá las opciones de los catálogos existentes", icono: "fas fa-fw fa-cog", user_created_id: 1, user_updated_id: nil, estado: "A", 2}
])

MacroProceso.create!([
  {nombre: "Agricola", descripcion: "Descripcion del macro proceso AGRICOLA.", abreviatura: "AG", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {nombre: "Industrial", descripcion: "Descripcion del macro proceso INDUSTRIAL", abreviatura: "IN", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {nombre: "Administracion", descripcion: "Descripcion del macro proceso ADMINISTRACION", abreviatura: "AD", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 3},
  {nombre: "Direccion", descripcion: "Descripción del macro proceso DIRECCION y su abreviatura.", abreviatura: "DI", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", 4},
  {nombre: "Labo CC", descripcion: "Descripción del macro proceso LABO CC", abreviatura: "LA", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 5}
])

MenuRol.create!([
{rol_id: 1, opcion_id: 1, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {rol_id: 1, opcion_id: 2, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {rol_id: 1, opcion_id: 3, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 3},
  {rol_id: 1, opcion_id: 4, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 4},
  {rol_id: 1, opcion_id: 5, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 5},
  {rol_id: 1, opcion_id: 6, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 6},
  {rol_id: 1, opcion_id: 7, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 7},
  {rol_id: 1, opcion_id: 8, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 8},
  {rol_id: 1, opcion_id: 9, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 9},
  {rol_id: 1, opcion_id: 10, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 10},
  {rol_id: 1, opcion_id: 11, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 11},
  {rol_id: 1, opcion_id: 12, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A", 12},
])

Opcion.create!([
{nombre: "Usuarios", descripcion: "Opción del menú para la administración de los usuarios del sistema.", icono: "fas fa-users", path: "usuarios_index_path", controlador: "usuarios", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {nombre: "Rol", descripcion: "Opción del menú para la administración de los roles del sistema.", icono: "fas fa-user-tag", path: "rols_path", controlador: "roles", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {nombre: "Usuario - Área", descripcion: "Opción del menú para la administración de las asignaciones del los usuarios a areas del sistema.", icono: "fas fa-users", path: "personas_areas_path", controlador: "personas_areas", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 3},
  {nombre: "Menú", descripcion: "Opción del menú para la administración de los menús del sistema.", icono: "fab fa-elementor", path: "menus_path", controlador: "menus", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 4},
  {nombre: "Opción - Menú", descripcion: "Opción del menú para la administración de las opciones por menú del sistema.", icono: "fas fa-minus-square", path: "opciones_path", controlador: "opciones", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 5},
  {nombre: "Menú - Rol", descripcion: "Opción del menú para la administración de los menús por rol del sistema.", icono: "fas fa-user-cog", path: "menu_roles_path", controlador: "menu_roles", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 6},
  {nombre: "Atributo", descripcion: "Opción del menú para la administración de los atributos del sistema.", icono: "fas fa-atom", path: "atributos_path", controlador: "atributos", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 7},
  {nombre: "Componente", descripcion: "Opción del menú para la administración de los componentes del sistema.", icono: "fab fa-codepen", path: "componentes_path", controlador: "componentes", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 8},
  {nombre: "Permisos de Formulario", descripcion: "Opción del menú para la administración de los permisos por formulario del sistema.", icono: "fas fa-clipboard-list", path: "opcion_cas_path", controlador: "opcion_cas", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 9},
  {nombre: "Permisos de Usuario", descripcion: "Opción del menú para la administración de los permisos por usuario del sistema.", icono: "fas fa-key", path: "persona_empresa_formularios_path", controlador: "persona_empresa_formularios", menu_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", 10},
  {nombre: "Empresas", descripcion: "Opción del menú para la administración de las empresas del sistema.", icono: "fas fa-building", path: "empresas_path", controlador: "empresas", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 11},
  {nombre: "Área - Empresa", descripcion: "Opción del menú para la administración de las áreas por empresa del sistema.", icono: "fas fa-sitemap", path: "areas_path", controlador: "areas", menu_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 12},
])

OpcionCa.create!([
  {opcion_id: 1, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {opcion_id: 1, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {opcion_id: 1, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 3},
  {opcion_id: 1, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 4},
  {opcion_id: 1, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 5},
  {opcion_id: 1, componente_id: 6, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 6},
  {opcion_id: 2, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 7},
  {opcion_id: 2, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 8},
  {opcion_id: 2, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 9},
  {opcion_id: 2, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 10},
  {opcion_id: 2, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 11},
  {opcion_id: 2, componente_id: 7, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 12},
  {opcion_id: 3, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 13},
  {opcion_id: 3, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 14},
  {opcion_id: 3, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 15},
  {opcion_id: 3, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 16},
  {opcion_id: 3, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 17},
  {opcion_id: 3, componente_id: 8, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 18},
  {opcion_id: 4, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 19},
  {opcion_id: 4, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 20},
  {opcion_id: 4, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 21},
  {opcion_id: 4, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 22},
  {opcion_id: 4, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 23},
  {opcion_id: 4, componente_id: 9, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 24},
  {opcion_id: 5, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 25},
  {opcion_id: 5, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 26},
  {opcion_id: 5, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 27},
  {opcion_id: 5, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 28},
  {opcion_id: 5, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 29},
  {opcion_id: 5, componente_id: 10, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 30},
  {opcion_id: 6, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 31},
  {opcion_id: 6, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 32},
  {opcion_id: 6, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 33},
  {opcion_id: 6, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 34},
  {opcion_id: 6, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 35},
  {opcion_id: 6, componente_id: 11, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 36},
  {opcion_id: 7, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 37},
  {opcion_id: 7, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 38},
  {opcion_id: 7, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 39},
  {opcion_id: 7, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 40},
  {opcion_id: 7, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 41},
  {opcion_id: 7, componente_id: 12, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 42},
  {opcion_id: 8, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 43},
  {opcion_id: 8, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 44},
  {opcion_id: 8, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 45},
  {opcion_id: 8, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 46},
  {opcion_id: 8, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 47},
  {opcion_id: 8, componente_id: 13, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 48},
  {opcion_id: 9, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 49},
  {opcion_id: 9, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 50},
  {opcion_id: 9, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 51},
  {opcion_id: 9, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 52},
  {opcion_id: 9, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 53},
  {opcion_id: 9, componente_id: 14, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 54},
  {opcion_id: 10, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 55},
  {opcion_id: 10, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 56},
  {opcion_id: 10, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 57},
  {opcion_id: 10, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 58},
  {opcion_id: 10, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 59},
  {opcion_id: 10, componente_id: 15, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 60},
  {opcion_id: 11, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 61},
  {opcion_id: 11, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 62},
  {opcion_id: 11, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 63},
  {opcion_id: 11, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 64},
  {opcion_id: 11, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 65},
  {opcion_id: 11, componente_id: 16, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 66},
  {opcion_id: 12, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario usuarios.", user_created_id: 1, user_updated_id: nil, estado: "A", 67},
  {opcion_id: 12, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 68},
  {opcion_id: 12, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón eliminar registro para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 69},
  {opcion_id: 12, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 70},
  {opcion_id: 12, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registrar para el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A", 71},
  {opcion_id: 12, componente_id: 17, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A", 72},
])

Parametro.create!([
  {user_id: 1, view_default: nil, area_id: "1.0", nombre_area: "Tecnología e Información TI", empresa_id: "1.0", nombre_empresa: "Ingenio Madre Tierra", ruta_predeterminada: nil, 1},
  {user_id: 3, view_default: nil, area_id: "1.0", nombre_area: "Tecnología e Información TI", empresa_id: "1.0", nombre_empresa: "Ingenio Madre Tierra", ruta_predeterminada: nil, 2}
])
Persona.create!([
  {foto: nil, nombre: "Mega Super", apellido: "Administrador", direccion: "TI", telefono: 11111111, token: nil, user_created_id: nil, user_updated_id: 1, estado: "A", user_id: 1, 1},
  {foto: "Mi_proyecto.jpg", nombre: "Jolberth", apellido: "Reyes", direccion: "Las delicias", telefono: 54685874, token: nil, user_created_id: nil, user_updated_id: 3, estado: "A", user_id: 3, 2}
])

PersonaEmpresaFormulario.create!([
  {personas_area_id: 1, opcion_ca_id: 1, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 44},
  {personas_area_id: 1, opcion_ca_id: 2, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 45},
  {personas_area_id: 1, opcion_ca_id: 3, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 46},
  {personas_area_id: 1, opcion_ca_id: 4, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 47},
  {personas_area_id: 1, opcion_ca_id: 5, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 48},
  {personas_area_id: 1, opcion_ca_id: 6, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 49},
  {personas_area_id: 1, opcion_ca_id: 7, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 50},
  {personas_area_id: 1, opcion_ca_id: 8, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 51},
  {personas_area_id: 1, opcion_ca_id: 9, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 52},
  {personas_area_id: 1, opcion_ca_id: 10, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 53},
  {personas_area_id: 1, opcion_ca_id: 11, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 54},
  {personas_area_id: 1, opcion_ca_id: 12, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 55},
  {personas_area_id: 1, opcion_ca_id: 13, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 56},
  {personas_area_id: 1, opcion_ca_id: 14, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 57},
  {personas_area_id: 1, opcion_ca_id: 15, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 58},
  {personas_area_id: 1, opcion_ca_id: 16, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 59},
  {personas_area_id: 1, opcion_ca_id: 17, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 60},
  {personas_area_id: 1, opcion_ca_id: 18, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 61},
  {personas_area_id: 1, opcion_ca_id: 19, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 62},
  {personas_area_id: 1, opcion_ca_id: 20, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 63},
  {personas_area_id: 1, opcion_ca_id: 21, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 64},
  {personas_area_id: 1, opcion_ca_id: 22, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 65},
  {personas_area_id: 1, opcion_ca_id: 23, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 66},
  {personas_area_id: 1, opcion_ca_id: 24, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 67},
  {personas_area_id: 1, opcion_ca_id: 25, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 68},
  {personas_area_id: 1, opcion_ca_id: 26, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 69},
  {personas_area_id: 1, opcion_ca_id: 27, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 70},
  {personas_area_id: 1, opcion_ca_id: 28, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 71},
  {personas_area_id: 1, opcion_ca_id: 29, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 72},
  {personas_area_id: 1, opcion_ca_id: 30, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 73},
  {personas_area_id: 1, opcion_ca_id: 31, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 74},
  {personas_area_id: 1, opcion_ca_id: 32, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 75},
  {personas_area_id: 1, opcion_ca_id: 33, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 76},
  {personas_area_id: 1, opcion_ca_id: 34, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 77},
  {personas_area_id: 1, opcion_ca_id: 35, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 78},
  {personas_area_id: 1, opcion_ca_id: 36, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 79},
  {personas_area_id: 1, opcion_ca_id: 37, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 80},
  {personas_area_id: 1, opcion_ca_id: 38, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 81},
  {personas_area_id: 1, opcion_ca_id: 39, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 82},
  {personas_area_id: 1, opcion_ca_id: 40, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 83},
  {personas_area_id: 1, opcion_ca_id: 41, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 84},
  {personas_area_id: 1, opcion_ca_id: 42, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 85},
  {personas_area_id: 1, opcion_ca_id: 43, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 86},
  {personas_area_id: 1, opcion_ca_id: 44, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 87},
  {personas_area_id: 1, opcion_ca_id: 45, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 88},
  {personas_area_id: 1, opcion_ca_id: 46, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 89},
  {personas_area_id: 1, opcion_ca_id: 47, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 90},
  {personas_area_id: 1, opcion_ca_id: 48, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 91},
  {personas_area_id: 1, opcion_ca_id: 49, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 92},
  {personas_area_id: 1, opcion_ca_id: 50, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 93},
  {personas_area_id: 1, opcion_ca_id: 51, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 94},
  {personas_area_id: 1, opcion_ca_id: 52, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 95},
  {personas_area_id: 1, opcion_ca_id: 53, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 96},
  {personas_area_id: 1, opcion_ca_id: 54, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 97},
  {personas_area_id: 1, opcion_ca_id: 55, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 98},
  {personas_area_id: 1, opcion_ca_id: 56, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 99},
  {personas_area_id: 1, opcion_ca_id: 57, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 100},
  {personas_area_id: 1, opcion_ca_id: 58, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 101},
  {personas_area_id: 1, opcion_ca_id: 59, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 102},
  {personas_area_id: 1, opcion_ca_id: 60, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 103},
  {personas_area_id: 1, opcion_ca_id: 61, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 104},
  {personas_area_id: 1, opcion_ca_id: 62, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 105},
  {personas_area_id: 1, opcion_ca_id: 63, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 106},
  {personas_area_id: 1, opcion_ca_id: 64, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 107},
  {personas_area_id: 1, opcion_ca_id: 65, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 108},
  {personas_area_id: 1, opcion_ca_id: 66, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 109},
  {personas_area_id: 1, opcion_ca_id: 67, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 110},
  {personas_area_id: 1, opcion_ca_id: 68, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 111},
  {personas_area_id: 1, opcion_ca_id: 69, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 112},
  {personas_area_id: 1, opcion_ca_id: 70, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 113},
  {personas_area_id: 1, opcion_ca_id: 71, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 114},
  {personas_area_id: 1, opcion_ca_id: 72, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A", 115},
])

PersonasArea.create!([
  {persona_id: 1, area_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {persona_id: 2, area_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {persona_id: 2, area_id: 3, user_created_id: 1, user_updated_id: nil, estado: "A", 3}
])

Rol.create!([
  {nombre: "SUPER ADMINISTRADOR", descripcion: "Rol para administrar el sistema", user_created_id: 1, user_updated_id: 1, estado: "A", 1},
  {nombre: "GESTOR", descripcion: "Role para agrupar los permisos que debe de tener un gestor en el sistema", user_created_id: 1, user_updated_id: nil, estado: "A", 2}
])

Proceso.create!([
  {nombre: "Dirección Estratégica", descripcion: "Proporcionar los lineamientos generales para la operación adecuada de la empresa y asegurar su cumplimiento.", abreviatura: "DI", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", macro_proceso_id: 1, tipo_proceso_id: 1, 1},
  {nombre: "Laboratorio de Control de Calidad", descripcion: "Apoyar el control del proceso a través de un monitoreo adecuado de las variables críticas de operación. Asegurar al cliente un producto que cumple los requisitos establecidos.", abreviatura: "L", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", macro_proceso_id: 2, tipo_proceso_id: 2, 2},
  {nombre: "Soporte Informático", descripcion: "Facilitar la información oportuna para la toma de decisiones a través de herramientas tecnológicas.", abreviatura: "TI", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", macro_proceso_id: 5, tipo_proceso_id: 3, 3}
])

TipoDocumento.create!([
  {nombre: "Manual", descripcion: "Descripcion del tipo documento MANUAL", abreviatura: "M", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {nombre: "Procedimiento", descripcion: "Descripcion del tipo documento PROCEDIMIENTO", abreviatura: "P", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", 2}
])
TipoProceso.create!([
  {nombre: "Procesos Estrategicos", descripcion: "Descripción de los Tipo de procesos", abreviatura: "EST", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", 1},
  {nombre: "Procesos de Seguimiento", descripcion: "Descripcion del proceso de seguimiento", abreviatura: "SEG", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 2},
  {nombre: "Procesos de Apoyo", descripcion: "Descripcion del proceso de apoyo", abreviatura: "APY", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 3},
  {nombre: "Procesos Clave", descripcion: "Descripcion del proceso clave", abreviatura: "CLV", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 4}
])
TipoSistema.create!([
  {nombre: "Sistema de Gestión de Calidad", descripcion: "Descripcion del sistema de gestion de calidad", abreviatura: "SGC", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {nombre: "Sistema de Gestión de Inocuidad de los Alimentos", descripcion: "Descripción de sistema de gestion de inocuidad de los alimentos.", abreviatura: "SGIA", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", 2}
])
TipoUsuario.create!([
  {nombre: "Propietario", descripcion: "Propietario (Dueño) de procesos.", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", 1},
  {nombre: "Jefe", descripcion: "Jefe de procesos.", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", 2}
])

#
# DESCARGA DE SEED 25/08/2022 03:00 PM
#

Componente.create!([
   {nombre: "MENU TIPO PROCESO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU TIPO SISTEMA", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU TIPO DOCUMENTO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU MACRO PROCESO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU TIPO USUARIO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU ETAPA DOCUMENTO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU ETAPA SOLICITUD", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU ACTIVIDAD", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU ESTADO DOCUMENTO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {nombre: "MENU PROCESO", descripcion: "Validación del Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"}
 ])

EtapaDocumento.create!([
   {nombre: "Firma", descripcion: "Descripción del documento en FIRMAS.", user_created_id: 1, user_updated_id: 1, estado: "A"},
   {nombre: "Autorizado", descripcion: "Descripción del documento AUTORIZADO", user_created_id: 1, user_updated_id: 1, estado: "A"}
 ])
EtapaSolicitud.create!([
   {nombre: "Autorización", descripcion: "Descripción de etapa de solicitudes.", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A"},
   {nombre: "Firma", descripcion: "Descripción de etapa de solicitudes.", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A"}
 ])

EstadoDocumento.create!([
  {nombre: "Pendiente", descripcion: "El documento esta pendiente de AUTORIZACION.", empresa_id: 1, user_created_id: 1, user_updated_id: 1, estado: "A", etapa_documento_id: 2},
  {nombre: "Pendiente", descripcion: "El documento esta pendiente de FIRMA.", empresa_id: 1, user_created_id: 1, user_updated_id: nil, estado: "A", etapa_documento_id: 1}
])

Opcion.create!([
 {nombre: "Tipo Proceso", descripcion: "Opción del menú para la administración de tipo proceso de un proceso.", icono: "fas fa-atom", path: "tipo_procesos_path", controlador: "tipo_procesos", menu_id: 2, user_created_id: 1, user_updated_id: 1, estado: "A"},
 {nombre: "Tipo Sistema", descripcion: "Opción del menú para la administración de tipo sistema de un sistema de gestión.", icono: "fas fa-sitemap", path: "tipo_sistemas_path", controlador: "tipo_sistemas", menu_id: 2, user_created_id: 1, user_updated_id: nil, estado: "A"},
 {nombre: "Tipo Documento", descripcion: "Opción del menú para la administración de tipo documento.", icono: "fas fa-book", path: "tipo_documentos_path", controlador: "tipo_documentos", menu_id: 2, user_created_id: 1, user_updated_id: 1, estado: "A"},
 {nombre: "Macro Proceso", descripcion: "Opción del menú para la administración de Macro Proceso.", icono: "fas fa-project-diagram", path: "macro_procesos_path", controlador: "macro_procesos", menu_id: 2, user_created_id: 1, user_updated_id: 1, estado: "A"},
 {nombre: "Tipo Usuario", descripcion: "Opción del menú para la administración de los tipos usuarios de un proceso.", icono: "fas fa-users", path: "tipo_usuarios_path", controlador: "tipo_usuarios", menu_id: 2, user_created_id: 1, user_updated_id: nil, estado: "A"},
 {nombre: "Etapa Documento", descripcion: "Opción del menú para la administración de Etapa de documentos.", icono: "fas fa-swatchbook", path: "etapa_documentos_path", controlador: "etapa_documentos", menu_id: 2, user_created_id: 1, user_updated_id: nil, estado: "A"},
 {nombre: "Etapa Solicitud", descripcion: "Opción del menú para la administración de la Etapa de una solicitud.", icono: "fas fa-terminal", path: "etapa_solicitudes_path", controlador: "etapa_solicitudes", menu_id: 2, user_created_id: 1, user_updated_id: nil, estado: "A"},
 {nombre: "Actividad Proceso", descripcion: "Opción del menú para la administración de Actividad del proceso.", icono: "fas fa-chart-line", path: "actividades_path", controlador: "actividades", menu_id: 2, user_created_id: 1, user_updated_id: 1, estado: "A"},
 {nombre: "Estado Documento", descripcion: "Opción del menú para la administración del estado de documento.", icono: "fas fa-tasks", path: "estado_documentos_path", controlador: "estado_documentos", menu_id: 2, user_created_id: 1, user_updated_id: nil, estado: "A"},
 {nombre: "Proceso", descripcion: "Opción del menú para la administración de Proceso.", icono: "fas fa-project-diagram", path: "procesos_path", controlador: "procesos", menu_id: 2, user_created_id: 1, user_updated_id: nil, estado: "A"}
])

MenuRol.create!([
    {rol_id: 1, opcion_id: 14, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 15, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 16, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 17, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 13, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 18, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 19, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 22, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 20, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"},
    {rol_id: 1, opcion_id: 21, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: "A"}
  ])

OpcionCa.create!([
   {opcion_id: 13, componente_id: 4, atributo_id: 2, descripcion: "Permiso para poder acceder al menu tipo usuario.", user_created_id: 1, user_updated_id: 1, estado: "A"},
   {opcion_id: 13, componente_id: 2, atributo_id: 1, descripcion: "Permiso del botón editar registro para el formulario Tipo Usuario.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 13, componente_id: 3, atributo_id: 1, descripcion: "Permiso del botón inactivar registro para el formulario Tipo Usuario.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 13, componente_id: 5, atributo_id: 1, descripcion: "Permiso del botón registro para el formulario Tipo Usuario.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 13, componente_id: 1, atributo_id: 1, descripcion: "Permiso del botón nuevo registro para el formulario Tipo Usuario.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 13, componente_id: 18, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 14, componente_id: 19, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 14, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario TIPO PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 14, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario TIPO PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 14, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario TIPO PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 14, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario TIPO PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 14, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario Tipo Proceso.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 15, componente_id: 20, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 15, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario TIPO SISTEMA.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 15, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario TIPO SISTEMA.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 15, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario TIPO SISTEMA.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 15, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario Tipo Sistema.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 15, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario TIPO SISTEMA.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 16, componente_id: 21, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 16, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario TIPO DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 16, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario TIPO DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 16, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario TIPO DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 16, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario Tipo Documento.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 16, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario TIPO DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 17, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario Macro Proceso.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 17, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario MACRO PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 17, componente_id: 22, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 17, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario MACRO PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 17, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario MACRO PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 17, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario MACRO PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 18, componente_id: 23, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 18, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario Etapa Documento.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 18, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario ETAPA DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 18, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario ETAPA DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 18, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario ETAPA DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 18, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario ETAPA DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 19, componente_id: 24, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 19, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario Etapa Solicitud.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 19, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario ETAPA SOLICITUD.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 19, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario ETAPA SOLICITUD.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 19, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario ETAPA SOLICITUD.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 19, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario ETAPA SOLICITUD.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 20, componente_id: 25, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 20, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 20, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario ESTADO DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 20, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario ESTADO DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 20, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario ESTADO DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 20, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario ESTADO DOCUMENTO.", user_created_id: 1, user_updated_id: nil, estado: "A"}
   {opcion_id: 21, componente_id: 26, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 21, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario Tipo Proceso.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 21, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 21, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 21, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 21, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 22, componente_id: 27, atributo_id: 3, descripcion: "Permiso para ver la opción en el Sidebar.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 22, componente_id: 4, atributo_id: 2, descripcion: "Permiso para mostrar el formulario Actividades del Proceso.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 22, componente_id: 1, atributo_id: 1, descripcion: "Permiso del boton nuevo registro, para el formulario ACTIVIDAD DE PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 22, componente_id: 2, atributo_id: 1, descripcion: "Permiso del boton editar registro, para el formulario ACTIVIDAD DE PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 22, componente_id: 3, atributo_id: 1, descripcion: "Permiso del boton eliminar registro, para el formulario ACTIVIDAD DE PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
   {opcion_id: 22, componente_id: 5, atributo_id: 1, descripcion: "Permiso del boton registrar, para el formulario ACTIVIDAD DE PROCESO.", user_created_id: 1, user_updated_id: nil, estado: "A"},
 ])

PersonaEmpresaFormulario.create!([
   {personas_area_id: 1, opcion_ca_id: 73, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 74, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 75, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 76, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 77, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 78, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 79, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 82, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 83, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 84, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 85, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 80, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 86, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 87, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 88, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 89, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 90, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 91, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 92, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 93, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 81, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 94, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 95, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 96, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 97, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 98, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 99, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 100, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 101, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 102, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 103, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 104, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 105, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 106, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 107, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 108, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 109, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 110, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 111, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 112, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 113, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 114, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 115, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 116, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 117, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 118, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 119, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 120, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 121, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 122, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 123, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 124, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 125, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 126, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 127, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 128, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 129, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 130, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 131, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"},
   {personas_area_id: 1, opcion_ca_id: 132, descripcion: "PERFIL", user_created_id: nil, user_updated_id: nil, estado: "A"}
 ])

=end


#
# SEED ACTUALIZADO EL 21/11/2022 03:40 PM
#


Menu.create!([
 { nombre: 'Documentación', descripcion: 'Menú padre que tendrá las opciones de la documentacion existente.', icono: 'fa fa-folder', user_created_id: 1, user_updated_id: nil, estado: 'A' }
])

Opcion.create!([
 { nombre: 'Permiso Documento', descripcion: 'Opción del menú para la administración de permiso de documentos.', icono: 'fas fa-key', path: 'permiso_documentos_path', controlador: 'permiso_documentos', menu_id: 2, user_created_id: 1, user_updated_id: nil, estado: 'A' },
 { nombre: 'Permiso Documento Usuario', descripcion: 'Opción del menú para la administración de permiso documento usuarios.', icono: 'fas fa-user-lock', path: 'permiso_documento_usuarios_path', controlador: 'permiso_documento_usuarios', menu_id: 2, user_created_id: 1, user_updated_id: nil, estado: 'A' },
 { nombre: 'Documento', descripcion: 'Opción del menú para la administración de documentos.', icono: 'fas fa-folder', path: 'documentos_path', controlador: 'documentos', menu_id: 3, user_created_id: 1, user_updated_id: nil, estado: 'A' }
])

MenuRol.create!([
  { rol_id: 1, opcion_id: 23, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' },
  { rol_id: 1, opcion_id: 24, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' },
  { rol_id: 1, opcion_id: 25, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' },
  { rol_id: 2, opcion_id: 23, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' },
  { rol_id: 2, opcion_id: 24, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' },
  { rol_id: 2, opcion_id: 25, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' },
  { rol_id: 3, opcion_id: 25, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' },
  { rol_id: 4, opcion_id: 25, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' },
  { rol_id: 5, opcion_id: 25, menu_padre: nil, user_created_id: 1, user_updated_id: nil, estado: 'A' }
])

Componente.create!([
   { nombre: 'MENU PERMISO DOCUMENTO', descripcion: 'Validación del Sidebar.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { nombre: 'MENU PERMISO DOCUMENTO USUARIO', descripcion: 'Validación del Sidebar.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { nombre: 'MENU DOCUMENTO', descripcion: 'Validación del Sidebar.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { nombre: 'BOTON VER PDF', descripcion: 'Boton para previsualizar el archivo PDF.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { nombre: 'BOTON VER WORD', descripcion: 'Botón para previsualizar el archivo WORD.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { nombre: 'BOTON VER EXCEL', descripcion: 'Botón para previsualizar el archivo EXCEL.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { nombre: 'BOTON DESCARGAR PDF', descripcion: 'Botón para descargar archivo PDF.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { nombre: 'BOTON DESCARGAR WORD', descripcion: 'Botón para descargar archivo WORD.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { nombre: 'BOTON DESCARGAR EXCEL', descripcion: 'Botón para descargar archivo EXCEL.', user_created_id: 1, user_updated_id: nil, estado: 'A' }
])

OpcionCa.create!([
   { opcion_id: 23, componente_id: 28, atributo_id: 3, descripcion: 'Permiso para ver la opción en el Sidebar.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 23, componente_id: 4, atributo_id: 2, descripcion: 'Permiso para mostrar el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 23, componente_id: 1, atributo_id: 1, descripcion: 'Permiso del botón nuevo registro para el formulario usuarios.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 23, componente_id: 5, atributo_id: 1, descripcion: 'Permiso del botón registrar para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 23, componente_id: 2, atributo_id: 1, descripcion: 'Permiso del botón editar registro para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 23, componente_id: 3, atributo_id: 1, descripcion: 'Permiso del botón eliminar registro para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 24, componente_id: 29, atributo_id: 3, descripcion: 'Permiso para ver la opción en el Sidebar.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 24, componente_id: 4, atributo_id: 2, descripcion: 'Permiso para mostrar el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 24, componente_id: 1, atributo_id: 1, descripcion: 'Permiso del botón nuevo registro para el formulario usuarios.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 24, componente_id: 5, atributo_id: 1, descripcion: 'Permiso del botón registrar para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 24, componente_id: 2, atributo_id: 1, descripcion: 'Permiso del botón editar registro para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 24, componente_id: 3, atributo_id: 1, descripcion: 'Permiso del botón eliminar registro para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 30, atributo_id: 3, descripcion: 'Permiso para ver la opción en el Sidebar.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 4, atributo_id: 2, descripcion: 'Permiso para mostrar el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 1, atributo_id: 1, descripcion: 'Permiso del botón nuevo registro para el formulario usuarios.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 5, atributo_id: 1, descripcion: 'Permiso del botón registrar para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 2, atributo_id: 1, descripcion: 'Permiso del botón editar registro para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 3, atributo_id: 1, descripcion: 'Permiso del botón eliminar registro para el formulario.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 31, atributo_id: 1, descripcion: 'Permiso del botón ver documento PDF.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 32, atributo_id: 1, descripcion: 'Permiso del botón ver documento WORD.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 33, atributo_id: 1, descripcion: 'Permiso del botón ver documento EXCEL.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 34, atributo_id: 1, descripcion: 'Permiso del botón descarga documento PDF.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 35, atributo_id: 1, descripcion: 'Permiso del botón descarga documento WORD.', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { opcion_id: 25, componente_id: 36, atributo_id: 1, descripcion: 'Permiso del botón descarga documento EXCEL.', user_created_id: 1, user_updated_id: nil, estado: 'A' }
])

PersonaEmpresaFormulario.create!([
   { personas_area_id: 1, opcion_ca_id: 133, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 134, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 135, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 136, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 137, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 138, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 139, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 140, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 141, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 142, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 143, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 144, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 145, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 146, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 147, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 148, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 149, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 150, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 151, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 152, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 153, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 154, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 155, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 1, opcion_ca_id: 156, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 133, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 134, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 135, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 136, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 137, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 138, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 139, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 140, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 141, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 142, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 143, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 144, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 145, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 146, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 147, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 148, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 149, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 150, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 151, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 152, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 153, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 154, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 155, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' },
   { personas_area_id: 2, opcion_ca_id: 156, descripcion: 'PERFIL', user_created_id: 1, user_updated_id: nil, estado: 'A' }
])