json.extract! solicitud_cambio, :id, :fecha_solicitud, :descripcion, :estado_documento_id, :etapa_solicitud_id, :user_created_id, :user_updated_id, :estado, :documento_id, :created_at, :updated_at
json.url solicitud_cambio_url(solicitud_cambio, format: :json)
