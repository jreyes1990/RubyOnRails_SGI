class CreateEtapaDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :etapa_documentos do |t|
      t.string :nombre, limit: 100
      t.string :descripcion
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10

      t.timestamps
    end
  end
end
