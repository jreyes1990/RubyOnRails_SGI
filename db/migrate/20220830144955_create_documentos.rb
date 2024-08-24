class CreateDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :documentos do |t|
      t.string :codigo, limit: 20
      t.integer :correlativo
      t.string :nombre, limit: 200
      t.date :fecha_vigencia
      t.integer :version
      t.string :descripcion
      t.integer :empresa_id
      t.integer :estado_documento_id
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :proceso, null: false, foreign_key: true
      t.references :tipo_sistema, null: false, foreign_key: true
      t.references :tipo_documento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
