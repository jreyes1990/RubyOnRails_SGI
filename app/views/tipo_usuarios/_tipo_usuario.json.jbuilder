json.extract! tipo_usuario, :id, :nombre, :descripcion, :empresa_id, :user_created_id, :user_updated_id, :estado, :created_at, :updated_at
json.url tipo_usuario_url(tipo_usuario, format: :json)
