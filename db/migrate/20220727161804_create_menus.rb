class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :nombre
      t.string :descripcion
      t.string :icono            
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado  

      t.timestamps
    end
  end
end
