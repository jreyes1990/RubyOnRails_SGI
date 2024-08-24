json.extract! tipo_proceso, :id, :nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado, :created_at, :updated_at
json.url tipo_proceso_url(tipo_proceso, format: :json)
