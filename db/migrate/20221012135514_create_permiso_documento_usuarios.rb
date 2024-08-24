class CreatePermisoDocumentoUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :permiso_documento_usuarios do |t|
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :user, null: false, foreign_key: true
      t.references :permiso_documento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
