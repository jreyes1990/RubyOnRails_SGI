json.extract! tipo_documento, :id, :nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado, :created_at, :updated_at
json.url tipo_documento_url(tipo_documento, format: :json)
