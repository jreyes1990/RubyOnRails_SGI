json.extract! tipo_sistema, :id, :nombre, :descripcion, :abreviatura, :empresa_id, :user_created_id, :user_updated_id, :estado, :created_at, :updated_at
json.url tipo_sistema_url(tipo_sistema, format: :json)
