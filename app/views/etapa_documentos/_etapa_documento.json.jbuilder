json.extract! etapa_documento, :id, :nombre, :descripcion, :user_created_id, :user_updated_id, :estado, :created_at, :updated_at
json.url etapa_documento_url(etapa_documento, format: :json)
