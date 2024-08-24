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

ActiveRecord::Schema.define(version: 2023_11_17_205925) do

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "i_action_text_rich_texts_uniq", unique: true
  end

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

  create_table "actividades", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.string "descripcion"
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "proceso_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proceso_id"], name: "i_actividades_proceso_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "empresa_id", precision: 38, null: false
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_areas_on_empresa_id"
  end

  create_table "atributos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "bitacora_documentos", force: :cascade do |t|
    t.string "codigo", limit: 20
    t.integer "correlativo", precision: 38
    t.string "nombre", limit: 200
    t.date "fecha_vigencia"
    t.integer "version", precision: 38
    t.string "descripcion"
    t.integer "empresa_id", precision: 38
    t.integer "proceso_id", precision: 38
    t.integer "tipo_sistema_id", precision: 38
    t.integer "tipo_documento_id", precision: 38
    t.integer "estado_documento_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "documento_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "componentes", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "datos_apis", force: :cascade do |t|
    t.string "nombre"
    t.string "url_api"
    t.string "token"
    t.string "estado"
    t.integer "user_created_id", precision: 38
    t.integer "user_update_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "datos_externos", force: :cascade do |t|
    t.string "nombre"
    t.string "url_api"
    t.string "token"
    t.string "estado"
    t.integer "user_create_id", precision: 38
    t.integer "user_update_id", precision: 38
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
    t.integer "user_create_id", precision: 38
    t.integer "user_update_id", precision: 38
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
    t.integer "user_create_id", precision: 38
    t.integer "user_update_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["datos_externo_id"], name: "i_det_dat_ext_dat_ext_id"
  end

  create_table "documentos", force: :cascade do |t|
    t.string "codigo", limit: 20
    t.integer "correlativo", precision: 38
    t.string "nombre", limit: 200
    t.date "fecha_vigencia"
    t.integer "version", precision: 38
    t.string "descripcion"
    t.integer "empresa_id", precision: 38
    t.integer "estado_documento_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "proceso_id", precision: 38, null: false
    t.integer "tipo_sistema_id", precision: 38, null: false
    t.integer "tipo_documento_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proceso_id"], name: "index_documentos_on_proceso_id"
    t.index ["tipo_documento_id"], name: "i_documentos_tipo_documento_id"
    t.index ["tipo_sistema_id"], name: "i_documentos_tipo_sistema_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "codigo_empresa", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "estado_documentos", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "descripcion"
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "etapa_documento_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["etapa_documento_id"], name: "i_est_doc_eta_doc_id"
  end

  create_table "etapa_documentos", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "descripcion"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "etapa_solicitudes", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "descripcion"
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "macro_procesos", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.string "descripcion"
    t.string "abreviatura", limit: 5
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_roles", force: :cascade do |t|
    t.integer "rol_id", precision: 38, null: false
    t.integer "opcion_id", precision: 38, null: false
    t.integer "menu_padre", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["opcion_id"], name: "index_menu_roles_on_opcion_id"
    t.index ["rol_id"], name: "index_menu_roles_on_rol_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "icono"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "old_passwords", force: :cascade do |t|
    t.string "encrypted_password", null: false
    t.string "password_archivable_type"
    t.integer "password_archivable_id", precision: 38
    t.datetime "created_at", precision: 6
    t.index ["password_archivable_type", "password_archivable_id"], name: "idx_old_passwords"
  end

  create_table "opcion_cas", force: :cascade do |t|
    t.integer "opcion_id", precision: 38, null: false
    t.integer "componente_id", precision: 38, null: false
    t.integer "atributo_id", precision: 38, null: false
    t.string "descripcion"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["atributo_id"], name: "i_opcion_cas_atributo_id"
    t.index ["componente_id"], name: "i_opcion_cas_componente_id"
    t.index ["opcion_id"], name: "index_opcion_cas_on_opcion_id"
  end

  create_table "opciones", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "icono"
    t.string "path"
    t.string "controlador"
    t.integer "menu_id", precision: 38, null: false
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_opciones_on_menu_id"
  end

  create_table "parametros", force: :cascade do |t|
    t.integer "user_id", precision: 38, null: false
    t.string "view_default"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "area_id"
    t.string "nombre_area", limit: 500
    t.decimal "empresa_id"
    t.string "nombre_empresa", limit: 500
    t.string "ruta_predeterminada", limit: 100
    t.index ["user_id"], name: "index_parametros_on_user_id"
  end

  create_table "permiso_documento_usuarios", force: :cascade do |t|
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "user_id", precision: 38, null: false
    t.integer "permiso_documento_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permiso_documento_id"], name: "i_per_doc_usu_per_doc_id"
    t.index ["user_id"], name: "i_per_doc_usu_use_id"
  end

  create_table "permiso_documentos", force: :cascade do |t|
    t.integer "tipo_usuario_id", precision: 38
    t.integer "proceso_id", precision: 38
    t.integer "tipo_sistema_id", precision: 38
    t.integer "documento_id", precision: 38
    t.string "todo", limit: 10
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tipo_documento_id", precision: 38
  end

  create_table "persona_empresa_formularios", force: :cascade do |t|
    t.integer "personas_area_id", precision: 38, null: false
    t.integer "opcion_ca_id", precision: 38, null: false
    t.string "descripcion"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["opcion_ca_id"], name: "i_per_emp_for_opc_ca_id"
    t.index ["personas_area_id"], name: "i_per_emp_for_per_are_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "foto"
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.integer "telefono", precision: 38
    t.string "token", limit: 1000
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.integer "user_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_personas_on_user_id"
  end

  create_table "personas_areas", force: :cascade do |t|
    t.integer "persona_id", precision: 38, null: false
    t.integer "area_id", precision: 38, null: false
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "i_personas_areas_area_id"
    t.index ["persona_id"], name: "i_personas_areas_persona_id"
  end

  create_table "procesos", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.string "descripcion"
    t.string "abreviatura", limit: 5
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "macro_proceso_id", precision: 38, null: false
    t.integer "tipo_proceso_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["macro_proceso_id"], name: "i_procesos_macro_proceso_id"
    t.index ["tipo_proceso_id"], name: "i_procesos_tipo_proceso_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "tipo_documentos", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.string "descripcion"
    t.string "abreviatura", limit: 5
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipo_procesos", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.string "descripcion"
    t.string "abreviatura", limit: 5
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipo_sistemas", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.string "descripcion"
    t.string "abreviatura", limit: 5
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipo_usuarios", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "descripcion"
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_tempo_passwords", force: :cascade do |t|
    t.integer "user_id", precision: 38, null: false
    t.string "password"
    t.string "password_tempo"
    t.integer "user_create_id", precision: 38
    t.integer "user_update_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "i_user_tempo_passwords_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_changed", limit: 1, default: "f"
    t.datetime "password_changed_at", precision: 6
    t.integer "sign_in_count", precision: 38, default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "i_users_reset_password_token", unique: true
  end

  create_table "usuario_procesos", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.string "descripcion"
    t.integer "empresa_id", precision: 38
    t.integer "user_created_id", precision: 38
    t.integer "user_updated_id", precision: 38
    t.string "estado", limit: 10
    t.integer "tipo_usuario_id", precision: 38, null: false
    t.integer "proceso_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proceso_id"], name: "i_usuario_procesos_proceso_id"
    t.index ["tipo_usuario_id"], name: "i_usu_pro_tip_usu_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "actividades", "procesos"
  add_foreign_key "areas", "empresas"
  add_foreign_key "bitacora_consulta_movils", "personas"
  add_foreign_key "bitacora_documentos", "documentos"
  add_foreign_key "bitacora_solicitud_cambios", "solicitud_cambios"
  add_foreign_key "bitacora_token_personas", "personas"
  add_foreign_key "detalle_datos_apis", "datos_apis"
  add_foreign_key "detalle_datos_externos", "datos_externos"
  add_foreign_key "documentos", "procesos"
  add_foreign_key "documentos", "tipo_documentos"
  add_foreign_key "documentos", "tipo_sistemas"
  add_foreign_key "estado_documentos", "etapa_documentos"
  add_foreign_key "menu_roles", "opciones"
  add_foreign_key "menu_roles", "roles"
  add_foreign_key "opcion_cas", "atributos"
  add_foreign_key "opcion_cas", "componentes"
  add_foreign_key "opcion_cas", "opciones"
  add_foreign_key "opciones", "menus"
  add_foreign_key "parametros", "users"
  add_foreign_key "permiso_documento_usuarios", "permiso_documentos"
  add_foreign_key "permiso_documento_usuarios", "users"
  add_foreign_key "persona_empresa_formularios", "opcion_cas"
  add_foreign_key "persona_empresa_formularios", "personas_areas"
  add_foreign_key "personas", "users"
  add_foreign_key "personas_areas", "areas"
  add_foreign_key "personas_areas", "personas"
  add_foreign_key "procesos", "macro_procesos"
  add_foreign_key "procesos", "tipo_procesos"
  add_foreign_key "seguimiento_solicitudes", "solicitud_cambios"
  add_foreign_key "solicitud_cambios", "documentos"
  add_foreign_key "user_tempo_passwords", "users"
  add_foreign_key "usuario_procesos", "procesos"
  add_foreign_key "usuario_procesos", "tipo_usuarios"

  create_view "documentos_views", sql_definition: <<-SQL
      SELECT DOCUMENTOS."ID",DOCUMENTOS."CODIGO",DOCUMENTOS."CORRELATIVO",DOCUMENTOS."NOMBRE",DOCUMENTOS."FECHA_VIGENCIA",DOCUMENTOS."VERSION",DOCUMENTOS."DESCRIPCION",DOCUMENTOS."EMPRESA_ID",DOCUMENTOS."ESTADO_DOCUMENTO_ID",DOCUMENTOS."USER_CREATED_ID",DOCUMENTOS."USER_UPDATED_ID",DOCUMENTOS."ESTADO",DOCUMENTOS."PROCESO_ID",DOCUMENTOS."TIPO_SISTEMA_ID",DOCUMENTOS."TIPO_DOCUMENTO_ID",DOCUMENTOS."CREATED_AT",DOCUMENTOS."UPDATED_AT", 
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
  create_view "opcion_cas_view", sql_definition: <<-SQL
      SELECT
      oc.id,
      o.nombre AS opcion,
      c.nombre AS componente,
      a.nombre AS atributo,
      oc.descripcion,
      oc.estado
  FROM
      OPCION_CAS OC
      INNER JOIN OPCIONES O ON
  	O.ID = OC.OPCION_ID
      INNER JOIN COMPONENTES C ON
  	C.ID = OC.COMPONENTE_ID
      INNER JOIN ATRIBUTOS A ON
  	A.ID = OC.ATRIBUTO_ID
  WHERE
  	OC.ESTADO = 'A'
  ORDER BY
  	OC.ID ASC
  SQL
end
