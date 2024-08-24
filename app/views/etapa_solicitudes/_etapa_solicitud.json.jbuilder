json.extract! etapa_solicitud, :id, :nombre, :descripcion, :empresa_id, :user_created_id, :user_updated_id, :estado, :created_at, :updated_at
json.url etapa_solicitud_url(etapa_solicitud, format: :json)
