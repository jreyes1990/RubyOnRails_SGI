class CreateTipoUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_usuarios do |t|
      t.string :nombre, limit: 100
      t.string :descripcion
      t.integer :empresa_id
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 100

      t.timestamps
    end
  end
end
