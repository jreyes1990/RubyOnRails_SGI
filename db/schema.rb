# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_08_24_110000) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", precision: 38, null: false
    t.integer "blob_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "i_act_sto_att_blo_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "i_act_stor_attach_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.integer "byte_size", limit: 19, precision: 19, null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "i_active_storage_blobs_key", unique: true
  end

  create_table "actividades", comment: "Modulo Actividades del proceso", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.integer "proceso_id", precision: 38, null: false, comment: "Identificador del proceso"
    t.string "nombre", limit: 150, null: false, comment: "Nombre de la actividad"
    t.string "descripcion", comment: "Descripción general de la actividad"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "proceso_id", "nombre"], name: "uidx_actividad", unique: true
  end

  create_table "areas", comment: "Catálogo de Áreas por Empresa", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.string "nombre", limit: 100, null: false, comment: "Nombre del área"
    t.string "descripcion", comment: "Descripción general del área"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "nombre"], name: "uidx_area", unique: true
  end

  create_table "atributos", comment: "Catálogo de Atributos", force: :cascade do |t|
    t.string "nombre", limit: 100, null: false, comment: "Nombre del atributo"
    t.string "descripcion", comment: "Descripción general del atributo"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["nombre"], name: "uidx_atributo", unique: true
  end

  create_table "bitacora_accesos", force: :cascade do |t|
    t.string "tabla"
    t.string "evento"
    t.integer "tipo_usuario_id", precision: 38
    t.integer "tipo_sistema_id", precision: 38
    t.integer "proceso_id", precision: 38
    t.integer "documento_id", precision: 38
    t.integer "tipo_documento_id", precision: 38
    t.integer "usuario_id", precision: 38
    t.integer "permiso_documento_id", precision: 38
    t.integer "permiso_documento_usuario_id", precision: 38
    t.string "todo", limit: 10
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bitacora_autenticacion_movils", force: :cascade do |t|
    t.integer "persona_id", precision: 38
    t.string "email"
    t.string "accion"
    t.string "descripcion"
    t.string "fecha"
    t.string "hora"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bitacora_consulta_movils", force: :cascade do |t|
    t.integer "persona_id", precision: 38, null: false
    t.string "email"
    t.string "accion"
    t.string "descripcion"
    t.string "fecha"
    t.string "hora"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["persona_id"], name: "i_bit_con_mov_per_id"
  end

  create_table "bitacora_documentos", comment: "Bitacora eventos del Documentos", force: :cascade do |t|
    t.integer "documento_id", precision: 38, null: false, comment: "Identificador del documento"
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.integer "proceso_id", precision: 38, null: false, comment: "Identificador del proceso"
    t.integer "tipo_sistema_id", precision: 38, null: false, comment: "Identificador del tipo de sistema"
    t.integer "tipo_documento_id", precision: 38, null: false, comment: "Identificador del tipo de documento"
    t.integer "estado_documento_id", precision: 38, null: false, comment: "Identificador del estado de documento"
    t.string "nombre", limit: 200, null: false, comment: "Nombre del documento"
    t.string "codigo", limit: 20, null: false, comment: "Identificador del codigo del documento"
    t.integer "correlativo", precision: 38, null: false, comment: "Identificador del correlativo del documento"
    t.date "fecha_vigencia", null: false, comment: "Fecha lanzamiento del documento"
    t.integer "version", precision: 38, null: false, comment: "Identificador de la version del documento"
    t.string "descripcion", comment: "Descripción general del documento"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["documento_id"], name: "i_bit_doc_doc_id"
  end

  create_table "bitacora_seguimientos", force: :cascade do |t|
    t.date "fecha_seguimiento"
    t.integer "version", precision: 38
    t.date "fecha_vigencia"
    t.string "descripcion"
    t.integer "estado_documento_id", precision: 38
    t.integer "etapa_seguimiento_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "solicitud_cambio_id", precision: 38
    t.integer "seguimiento_solicitud_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bitacora_solicitud_cambios", force: :cascade do |t|
    t.date "fecha_solicitud"
    t.string "descripcion"
    t.integer "documento_id", precision: 38
    t.integer "estado_documento_id", precision: 38
    t.integer "etapa_solicitud_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "solicitud_cambio_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["solicitud_cambio_id"], name: "i_bit_sol_cam_sol_cam_id"
  end

  create_table "bitacora_token_personas", force: :cascade do |t|
    t.integer "persona_id", precision: 38, null: false
    t.string "accion"
    t.string "descripcion"
    t.string "fecha"
    t.string "hora"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["persona_id"], name: "i_bit_tok_per_per_id"
  end

  create_table "componentes", comment: "Catálogo de Componentes", force: :cascade do |t|
    t.string "nombre", limit: 100, null: false, comment: "Nombre del componente"
    t.string "descripcion", comment: "Descripción general del componente"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["nombre"], name: "uidx_componente", unique: true
  end

  create_table "datos_apis", force: :cascade do |t|
    t.string "nombre"
    t.string "url_api"
    t.string "token"
    t.string "estado"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "datos_externos", force: :cascade do |t|
    t.string "nombre"
    t.string "url_api"
    t.string "token"
    t.string "estado"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "detalle_datos_apis", force: :cascade do |t|
    t.integer "datos_api_id", precision: 38, null: false
    t.string "nombre"
    t.string "param1"
    t.string "param2"
    t.string "param3"
    t.string "param4"
    t.string "param5"
    t.string "tipo"
    t.string "body"
    t.string "estado"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["datos_api_id"], name: "i_det_dat_api_dat_api_id"
  end

  create_table "detalle_datos_externos", force: :cascade do |t|
    t.integer "datos_externo_id", precision: 38, null: false
    t.string "nombre"
    t.string "param1"
    t.string "param2"
    t.string "param3"
    t.string "param4"
    t.string "param5"
    t.string "tipo"
    t.string "body"
    t.string "estado"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["datos_externo_id"], name: "i_det_dat_ext_dat_ext_id"
  end

  create_table "documentos", comment: "Modulo Configuración de Documentos", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.integer "proceso_id", precision: 38, null: false, comment: "Identificador del proceso"
    t.integer "tipo_sistema_id", precision: 38, null: false, comment: "Identificador del tipo de sistema"
    t.integer "tipo_documento_id", precision: 38, null: false, comment: "Identificador del tipo de documento"
    t.integer "estado_documento_id", precision: 38, null: false, comment: "Identificador del estado de documento"
    t.string "nombre", limit: 200, null: false, comment: "Nombre del documento"
    t.string "codigo", limit: 20, null: false, comment: "Identificador del codigo del documento"
    t.integer "correlativo", precision: 38, null: false, comment: "Identificador del correlativo del documento"
    t.date "fecha_vigencia", null: false, comment: "Fecha lanzamiento del documento"
    t.integer "version", precision: 38, null: false, comment: "Identificador de la version del documento"
    t.string "descripcion", comment: "Descripción general del documento"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "proceso_id", "tipo_sistema_id", "tipo_documento_id", "estado_documento_id", "nombre"], name: "uidx_documento", unique: true
  end

  create_table "empresas", comment: "Catálogo de Empresas", force: :cascade do |t|
    t.integer "codigo_empresa", precision: 38, null: false, comment: "Identificador codigo de la empresa"
    t.string "nombre", limit: 100, null: false, comment: "Nombre de la empresa"
    t.string "descripcion", comment: "Descripción general de la empresa"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["nombre"], name: "uidx_empresa", unique: true
  end

  create_table "estado_documentos", comment: "Modulo Configuración Estado de Documentos", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.integer "etapa_documento_id", precision: 38, null: false, comment: "Identificador de la etapa del documento"
    t.string "nombre", limit: 150, null: false, comment: "Nombre del estado del documento"
    t.string "descripcion", comment: "Descripción general del estado del documento"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "etapa_documento_id", "nombre"], name: "uidx_estadodocumento", unique: true
  end

  create_table "etapa_documentos", comment: "Catálogo Etapa de Documentos", force: :cascade do |t|
    t.string "nombre", limit: 150, null: false, comment: "Nombre de la etapa del documento"
    t.string "descripcion", comment: "Descripción general de la etapa del documento"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["nombre"], name: "uidx_etapadocumento", unique: true
  end

  create_table "etapa_solicitudes", comment: "Catálogo Etapa de Solicitudes", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.string "nombre", limit: 150, null: false, comment: "Nombre de la etapa de la solicitud"
    t.string "descripcion", comment: "Descripción general de la etapa de la solicitud"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "nombre"], name: "uidx_etapasolicitud", unique: true
  end

  create_table "macro_procesos", comment: "Catálogo de Macro-Procesos", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.string "nombre", limit: 150, null: false, comment: "Nombre del macro-proceso"
    t.string "descripcion", comment: "Descripción general del macro-proceso"
    t.string "abreviatura", limit: 5, null: false, comment: "Identificador de abreviatura del macro-proceso"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "nombre"], name: "uidx_macroproceso", unique: true
  end

  create_table "menu_roles", comment: "Catálogo Configuración de Menú por Roles", force: :cascade do |t|
    t.integer "menu_id", precision: 38, null: false, comment: "Identificador del menú"
    t.integer "opcion_id", precision: 38, null: false, comment: "Identificador de la opción por menú"
    t.integer "rol_id", precision: 38, null: false, comment: "Identificador del rol"
    t.string "descripcion", comment: "Descripción general del menú por rol"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["menu_id", "opcion_id", "rol_id"], name: "uidx_menurol", unique: true
  end

  create_table "menus", comment: "Catálogo de Menú", force: :cascade do |t|
    t.string "nombre", limit: 100, null: false, comment: "Nombre del menú"
    t.string "descripcion", comment: "Descripción general del menú"
    t.string "icono", limit: 50, null: false, comment: "Identificador de icono para el menú"
    t.string "menu_sidebar", comment: "Identificador del menú a utilizar en el sidebar"
    t.string "visible_sidebar", limit: 1, default: "S", null: false, comment: "El menú será visible en el sidebar? [S: Si, N: No]"
    t.integer "posicion", precision: 38, comment: "Orden del menú a utilizar en el sidebar"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["nombre"], name: "uidx_menu", unique: true
  end

  create_table "old_passwords", force: :cascade do |t|
    t.string "encrypted_password", null: false
    t.string "password_archivable_type"
    t.integer "password_archivable_id", precision: 38
    t.datetime "created_at", precision: 6
    t.index ["password_archivable_type", "password_archivable_id"], name: "idx_old_passwords"
  end

  create_table "opcion_cas", comment: "Módulo Configuración de Opcion-Componente-Atributo", force: :cascade do |t|
    t.integer "opcion_id", precision: 38, null: false, comment: "Identificador de la opción por opcion_cas"
    t.integer "componente_id", precision: 38, null: false, comment: "Identificador del componente por opcion_cas"
    t.integer "atributo_id", precision: 38, null: false, comment: "Identificador del atributo por opcion_cas"
    t.string "descripcion", comment: "Descripción general de la opción_ca"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["opcion_id", "componente_id", "atributo_id"], name: "uidx_opcionca", unique: true
  end

  create_table "opciones", comment: "Catálogo de Opciones por Menú", force: :cascade do |t|
    t.integer "menu_id", precision: 38, null: false, comment: "Identificador del menú"
    t.integer "sub_opcion_id", precision: 38, null: false, comment: "Identificador de la sub-opción"
    t.string "nombre", limit: 100, null: false, comment: "Nombre de la opción"
    t.string "descripcion", comment: "Descripción general de la opción"
    t.string "icono", limit: 50, comment: "Icono que identificará la opción"
    t.string "path", null: false, comment: "Identificador de ruta de navegación"
    t.string "controlador", limit: 300, null: false, comment: "Identificador de controlador de navegación"
    t.string "componente_sidebar", comment: "Identificador el componente a utilizar en el sidebar"
    t.string "visible_sidebar", limit: 1, default: "S", null: false, comment: "El componente será visible en el sidebar?  [S: Si, N: No]"
    t.integer "posicion", precision: 38, comment: "Orden del componente a utilizar en el sidebar"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["menu_id", "sub_opcion_id", "nombre"], name: "uidx_opcion", unique: true
  end

  create_table "parametros", comment: "Módulo Configuración de parametros de usuario", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.integer "area_id", precision: 38, null: false, comment: "Identificador del área"
    t.integer "user_id", precision: 38, null: false, comment: "Identificador del usuario"
    t.string "nombre_area"
    t.string "nombre_empresa"
    t.string "ruta_predeterminada"
    t.string "view_default"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "area_id", "user_id"], name: "uidx_parametro", unique: true
  end

  create_table "permiso_documento_usuarios", comment: "Modulo Permisos de documento por Usuario", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, comment: "Identificador de la empresa"
    t.integer "user_id", precision: 38, null: false, comment: "Identificador del usuario"
    t.integer "permiso_documento_id", precision: 38, null: false, comment: "Identificador del permiso del documento"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "user_id", "permiso_documento_id"], name: "uidx_permisodoctouser", unique: true
  end

  create_table "permiso_documentos", comment: "Modulo Permisos de documento", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, comment: "Identificador de la empresa"
    t.integer "tipo_usuario_id", precision: 38, null: false, comment: "Identificador de la clasificación del documento"
    t.integer "proceso_id", precision: 38, null: false, comment: "Identificador del proceso"
    t.integer "tipo_sistema_id", precision: 38, null: false, comment: "Identificador del tipo de sistema"
    t.integer "tipo_documento_id", precision: 38, null: false, comment: "Identificador del tipo de documento"
    t.integer "documento_id", precision: 38, null: false, comment: "Identificador del documento"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["documento_id"], name: "i_per_doc_doc_id"
    t.index ["empresa_id", "tipo_usuario_id", "proceso_id", "tipo_sistema_id", "tipo_documento_id", "documento_id"], name: "uidx_permisodocto", unique: true
  end

  create_table "persona_empresa_formularios", comment: "Módulo Configuración de (Persona-Área)-(Opcion-Componente-Atributo)", force: :cascade do |t|
    t.integer "personas_area_id", precision: 38, null: false, comment: "Identificador de la persona por área"
    t.integer "opcion_ca_id", precision: 38, null: false, comment: "Identificador de opcion_cas"
    t.string "descripcion", comment: "Descripción general de la persona empresa formulario"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["personas_area_id", "opcion_ca_id"], name: "uidx_pempform", unique: true
  end

  create_table "personas", comment: "Módulo Configuración de Usuarios", force: :cascade do |t|
    t.integer "user_id", precision: 38, null: false, comment: "Identificador del usuario"
    t.string "nombre", limit: 100, null: false, comment: "Nombre de la persona"
    t.string "apellido", limit: 100, null: false, comment: "Apellido de la persona"
    t.text "foto", comment: "Foto de la persona"
    t.integer "telefono", limit: 8, precision: 8, default: 66854900, null: false, comment: "Número de celular de la persona"
    t.string "direccion"
    t.string "token", limit: 1000
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["user_id"], name: "uidx_persona"
  end

  create_table "personas_areas", comment: "Módulo Configuración de Persona-Área-Rol", force: :cascade do |t|
    t.integer "persona_id", precision: 38, null: false, comment: "Identificador de la persona"
    t.integer "area_id", precision: 38, null: false, comment: "Identificador del área"
    t.integer "rol_id", precision: 38, comment: "Identificador del rol"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["persona_id", "area_id", "rol_id"], name: "uidx_personaarea", unique: true
  end

  create_table "procesos", comment: "Modulo Configuración Procesos", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.integer "macro_proceso_id", precision: 38, null: false, comment: "Identificador del macro proceso"
    t.integer "tipo_proceso_id", precision: 38, null: false, comment: "Identificador del tipo de proceso"
    t.string "nombre", limit: 150, null: false, comment: "Nombre del proceso"
    t.string "descripcion", comment: "Descripción general del proceso"
    t.string "abreviatura", limit: 5, null: false, comment: "Identificador de la abreviatura del proceso"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "macro_proceso_id", "tipo_proceso_id", "nombre"], name: "uidx_proceso", unique: true
  end

  create_table "roles", comment: "Catálogo de Roles", force: :cascade do |t|
    t.string "nombre", limit: 100, null: false, comment: "Nombre del rol"
    t.string "descripcion", comment: "Descripción general del rol"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["nombre"], name: "uidx_rol", unique: true
  end

  create_table "seguimiento_solicitudes", force: :cascade do |t|
    t.date "fecha_seguimiento"
    t.integer "version", precision: 38
    t.date "fecha_vigencia"
    t.string "descripcion"
    t.integer "estado_documento_id", precision: 38
    t.integer "etapa_seguimiento_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "solicitud_cambio_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["solicitud_cambio_id"], name: "i_seg_sol_sol_cam_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "solicitud_cambios", force: :cascade do |t|
    t.date "fecha_solicitud"
    t.string "descripcion"
    t.integer "estado_documento_id", precision: 38
    t.integer "etapa_solicitud_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "documento_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["documento_id"], name: "i_sol_cam_doc_id"
  end

  create_table "sub_opciones", comment: "Catálogo de Sub-Opciones", force: :cascade do |t|
    t.string "nombre", limit: 100, default: "OPCIONES:", null: false, comment: "Nombre de la sub-opción"
    t.string "descripcion", comment: "Descripción general de la sub-opción"
    t.string "visible_sidebar", limit: 1, default: "S", null: false, comment: "La sub-opción será visible en el sidebar?  [S: Si, N: No]"
    t.integer "posicion", precision: 38, comment: "Orden de la sub-opción a utilizar en el sidebar"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["nombre"], name: "uidx_subopcion", unique: true
  end

  create_table "tipo_documentos", comment: "Catálogo Tipo de Documentos", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.string "nombre", limit: 150, null: false, comment: "Nombre tipo de documento"
    t.string "descripcion", comment: "Descripción general del tipo de documento"
    t.string "abreviatura", limit: 5, null: false, comment: "Identificador de abreviatura del tipo de documento"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "nombre"], name: "uidx_tipodocumento", unique: true
  end

  create_table "tipo_procesos", comment: "Catálogo Tipo de Procesos", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.string "nombre", limit: 150, null: false, comment: "Nombre tipo de proceso"
    t.string "descripcion", comment: "Descripción general del tipo de proceso"
    t.string "abreviatura", limit: 5, null: false, comment: "Identificador de abreviatura del tipo de proceso"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "nombre"], name: "uidx_tipoproceso", unique: true
  end

  create_table "tipo_sistemas", comment: "Catálogo Tipo de Sistemas", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.string "nombre", limit: 150, null: false, comment: "Nombre tipo de sistema"
    t.string "descripcion", comment: "Descripción general del tipo de sistema"
    t.string "abreviatura", limit: 5, null: false, comment: "Identificador de abreviatura del tipo de sistema"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "nombre"], name: "uidx_tiposistema", unique: true
  end

  create_table "tipo_usuarios", comment: "Catálogo de Calsificación de documentos", force: :cascade do |t|
    t.integer "empresa_id", precision: 38, null: false, comment: "Identificador de la empresa"
    t.string "nombre", limit: 100, null: false, comment: "Nombre de la clasificación"
    t.string "descripcion", comment: "Descripción general de la clasificación"
    t.integer "user_created_id", precision: 38, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador de usuario al actualizar en la aplicación web"
    t.string "estado", limit: 10, default: "A", null: false, comment: "Estados: [A]: Activo  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "nombre"], name: "uidx_tipousuario", unique: true
  end

  create_table "users", comment: "Catálogo de usuarios", force: :cascade do |t|
    t.string "email", default: "Corre electronico del usuario", null: false
    t.string "encrypted_password", default: "Contraseña encriptada", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "user_created_id", precision: 38, comment: "Identificador del usuario al registrar en la aplicación web"
    t.integer "user_updated_id", precision: 38, comment: "Identificador del usuario al actualizar en la aplicación web"
    t.string "estado", default: "A", comment: "Estado del user: [A]: Activo;  [I]: Inactivo"
    t.datetime "created_at", precision: 6, null: false, comment: "Fecha y hora al registrar datos"
    t.datetime "updated_at", precision: 6, null: false, comment: "Fecha y hora al actualizar datos"
    t.integer "sign_in_count", precision: 38, default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "password_changed", limit: 1, default: "f"
    t.datetime "password_changed_at", precision: 6
    t.index ["email"], name: "uidx_email", unique: true
    t.index ["reset_password_token"], name: "uidx_resetpasstoken", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "actividades", "empresas", name: "fk_actividad_empresa"
  add_foreign_key "actividades", "procesos", name: "fk_actividad_proceso"
  add_foreign_key "areas", "empresas", name: "fk_area_empresa"
  add_foreign_key "bitacora_consulta_movils", "personas"
  add_foreign_key "bitacora_documentos", "documentos", name: "fk_bitaDocumento_documento"
  add_foreign_key "bitacora_solicitud_cambios", "solicitud_cambios"
  add_foreign_key "bitacora_token_personas", "personas"
  add_foreign_key "detalle_datos_apis", "datos_apis"
  add_foreign_key "detalle_datos_externos", "datos_externos"
  add_foreign_key "documentos", "empresas", name: "fk_documento_empresa"
  add_foreign_key "documentos", "estado_documentos", name: "fk_documento_estadoDocumento"
  add_foreign_key "documentos", "procesos", name: "fk_documento_proceso"
  add_foreign_key "documentos", "tipo_documentos", name: "fk_documento_tipoDocumento"
  add_foreign_key "documentos", "tipo_sistemas", name: "fk_documento_tipoSistema"
  add_foreign_key "estado_documentos", "empresas", name: "fk_estadoDocumento_empresa"
  add_foreign_key "estado_documentos", "etapa_documentos", name: "fk_estadoDocumento_etapaDocto"
  add_foreign_key "etapa_solicitudes", "empresas", name: "fk_etapaSolicitud_empresa"
  add_foreign_key "macro_procesos", "empresas", name: "fk_macroProceso_empresa"
  add_foreign_key "menu_roles", "menus", name: "fk_menuRol_menu"
  add_foreign_key "menu_roles", "opciones", name: "fk_menuRol_opcion"
  add_foreign_key "menu_roles", "roles", name: "fk_menuRol_rol"
  add_foreign_key "opcion_cas", "atributos", name: "fk_opcionCa_atributo"
  add_foreign_key "opcion_cas", "componentes", name: "fk_opcionCa_componente"
  add_foreign_key "opcion_cas", "opciones", name: "fk_opcionCa_opcion"
  add_foreign_key "opciones", "menus", name: "fk_opcion_menu"
  add_foreign_key "opciones", "sub_opciones", name: "fk_opcion_subOpcion"
  add_foreign_key "parametros", "areas", name: "fk_parametro_area"
  add_foreign_key "parametros", "empresas", name: "fk_parametro_empresa"
  add_foreign_key "parametros", "users", name: "fk_parametro_user"
  add_foreign_key "permiso_documento_usuarios", "empresas", name: "fk_permisoDoctoUser_empresa"
  add_foreign_key "permiso_documento_usuarios", "permiso_documentos", name: "fk_permisoDoctoUser_permDocto"
  add_foreign_key "permiso_documento_usuarios", "users", name: "fk_permisoDoctoUser_usuario"
  add_foreign_key "permiso_documentos", "documentos", name: "fk_permisoDocto_documento"
  add_foreign_key "permiso_documentos", "empresas", name: "fk_permisoDocto_empresa"
  add_foreign_key "permiso_documentos", "procesos", name: "fk_permisoDocto_proceso"
  add_foreign_key "permiso_documentos", "tipo_documentos", name: "fk_permisoDocto_tipoDocto"
  add_foreign_key "permiso_documentos", "tipo_sistemas", name: "fk_permisoDocto_tipoSistema"
  add_foreign_key "permiso_documentos", "tipo_usuarios", name: "fk_permisoDocto_tipoUsuario"
  add_foreign_key "persona_empresa_formularios", "opcion_cas", name: "fk_pEmpForm_opcionCa"
  add_foreign_key "persona_empresa_formularios", "personas_areas", name: "fk_pEmpForm_personArea"
  add_foreign_key "personas", "users", name: "fk_persona_user"
  add_foreign_key "personas_areas", "areas", name: "fk_personaArea_area"
  add_foreign_key "personas_areas", "personas", name: "fk_personaArea_persona"
  add_foreign_key "personas_areas", "roles", name: "fk_personaArea_rol"
  add_foreign_key "procesos", "empresas", name: "fk_proceso_empresa"
  add_foreign_key "procesos", "macro_procesos", name: "fk_proceso_macroProceso"
  add_foreign_key "procesos", "tipo_procesos", name: "fk_proceso_tipoProceso"
  add_foreign_key "seguimiento_solicitudes", "solicitud_cambios"
  add_foreign_key "solicitud_cambios", "documentos"
  add_foreign_key "tipo_documentos", "empresas", name: "fk_tipoDocumento_empresa"
  add_foreign_key "tipo_procesos", "empresas", name: "fk_tipoProceso_empresa"
  add_foreign_key "tipo_sistemas", "empresas", name: "fk_tipoSistema_empresa"
  add_foreign_key "tipo_usuarios", "empresas", name: "fk_tipoUsuario_empresa"

  create_view "documentos_views", sql_definition: <<-SQL
      SELECT DOCUMENTOS."ID",DOCUMENTOS."EMPRESA_ID",DOCUMENTOS."PROCESO_ID",DOCUMENTOS."TIPO_SISTEMA_ID",DOCUMENTOS."TIPO_DOCUMENTO_ID",DOCUMENTOS."ESTADO_DOCUMENTO_ID",DOCUMENTOS."NOMBRE",DOCUMENTOS."CODIGO",DOCUMENTOS."CORRELATIVO",DOCUMENTOS."FECHA_VIGENCIA",DOCUMENTOS."VERSION",DOCUMENTOS."DESCRIPCION",DOCUMENTOS."USER_CREATED_ID",DOCUMENTOS."USER_UPDATED_ID",DOCUMENTOS."ESTADO",DOCUMENTOS."CREATED_AT",DOCUMENTOS."UPDATED_AT", 
  (DOCUMENTOS.CODIGO||LPAD(DOCUMENTOS.CORRELATIVO,3,0)) AS CODIGO_DOCUMENTO, 
  TIPO_SISTEMAS.NOMBRE AS NOMBRE_SISTEMA, TIPO_SISTEMAS.ABREVIATURA AS ABR_SISTEMA,
  PROCESOS.NOMBRE AS NOMBRE_PROCESO, PROCESOS.ABREVIATURA AS ABR_PROCESO,
  TIPO_DOCUMENTOS.NOMBRE AS NOMBRE_TIPO_DOCTO, TIPO_DOCUMENTOS.ABREVIATURA AS ABR_TIPO_DOCTO,
  ESTADO_DOCUMENTOS.NOMBRE AS NOMBRE_ESTADO_DOCTO
  FROM DOCUMENTOS 
  LEFT JOIN TIPO_SISTEMAS ON(DOCUMENTOS.TIPO_SISTEMA_ID=TIPO_SISTEMAS.ID)
  LEFT JOIN PROCESOS ON(DOCUMENTOS.PROCESO_ID=PROCESOS.ID)
  LEFT JOIN TIPO_DOCUMENTOS ON(DOCUMENTOS.TIPO_DOCUMENTO_ID=TIPO_DOCUMENTOS.ID)
  LEFT JOIN ESTADO_DOCUMENTOS ON(DOCUMENTOS.ESTADO_DOCUMENTO_ID=ESTADO_DOCUMENTOS.ID)
  SQL
end
