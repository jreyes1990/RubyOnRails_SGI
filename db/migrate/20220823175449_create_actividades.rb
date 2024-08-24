class CreateActividades < ActiveRecord::Migration[6.0]
  def change
    create_table :actividades do |t|
      t.string :nombre, limit: 200
      t.string :descripcion
      t.integer :empresa_id
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :proceso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
