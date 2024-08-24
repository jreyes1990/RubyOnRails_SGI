class CreateBitacoraSeguimientos < ActiveRecord::Migration[6.0]
  def change
    create_table :bitacora_seguimientos do |t|
      t.date :fecha_seguimiento
      t.integer :version
      t.date :fecha_vigencia
      t.string :descripcion
      t.integer :estado_documento_id
      t.integer :etapa_seguimiento_id
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.integer :solicitud_cambio_id
      t.integer :seguimiento_solicitud_id

      t.timestamps
    end
  end
end
