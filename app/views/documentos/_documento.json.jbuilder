json.extract! documento, :id, :codigo, :correlativo, :nombre, :fecha_vigencia, :version, :descripcion, :empresa_id, :estado_documento_id, :user_created_id, :user_updated_id, :estado, :proceso_id, :tipo_sistema_id, :tipo_documento_id, :created_at, :updated_at
json.url documento_url(documento, format: :json)
