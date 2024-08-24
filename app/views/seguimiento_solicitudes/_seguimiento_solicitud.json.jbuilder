json.extract! seguimiento_solicitud, :id, :fecha_seguimiento, :version, :fecha_vigencia, :descripcion, :estado_documento_id, :etapa_seguimiento_id, :user_created_id, :user_updated_id, :estado, :solicitud_cambio_id, :created_at, :updated_at
json.url seguimiento_solicitud_url(seguimiento_solicitud, format: :json)
