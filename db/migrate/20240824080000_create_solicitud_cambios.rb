class CreateSolicitudCambios < ActiveRecord::Migration[6.0]
  def change
    create_table :solicitud_cambios do |t|
      t.date :fecha_solicitud
      t.string :descripcion
      t.integer :estado_documento_id
      t.integer :etapa_solicitud_id
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :documento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
