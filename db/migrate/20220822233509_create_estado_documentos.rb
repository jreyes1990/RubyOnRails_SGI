class CreateEstadoDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :estado_documentos do |t|
      t.string :nombre, limit: 100
      t.string :descripcion
      t.integer :empresa_id
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :etapa_documento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
