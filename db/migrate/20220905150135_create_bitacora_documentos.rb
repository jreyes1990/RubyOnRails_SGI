class CreateBitacoraDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :bitacora_documentos do |t|
      t.string :codigo, limit: 20
      t.integer :correlativo
      t.string :nombre, limit: 200
      t.date :fecha_vigencia
      t.integer :version
      t.string :descripcion
      t.integer :empresa_id
      t.integer :proceso_id
      t.integer :tipo_sistema_id
      t.integer :tipo_documento_id
      t.integer :estado_documento_id
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :documento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
