json.extract! actividad, :id, :nombre, :descripcion, :empresa_id, :user_created_id, :user_updated_id, :estado, :proceso_id, :created_at, :updated_at
json.url actividad_url(actividad, format: :json)
