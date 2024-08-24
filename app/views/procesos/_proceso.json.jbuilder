json.extract! proceso, :id, :nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado, :macro_proceso_id, :tipo_proceso_id, :created_at, :updated_at
json.url proceso_url(proceso, format: :json)
