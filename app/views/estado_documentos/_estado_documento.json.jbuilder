json.extract! estado_documento, :id, :nombre, :descripcion, :empresa_id, :user_created_id, :user_updated_id, :estado, :etapa_documento_id, :created_at, :updated_at
json.url estado_documento_url(estado_documento, format: :json)
