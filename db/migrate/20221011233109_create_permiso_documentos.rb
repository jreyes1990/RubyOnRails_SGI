class CreatePermisoDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :permiso_documentos do |t|
      t.integer :tipo_usuario_id
      t.integer :proceso_id
      t.integer :tipo_sistema_id
      t.integer :documento_id
      t.string :todo, limit: 10
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10

      t.timestamps
    end
  end
end
