class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :nombre
      t.string :descripcion            
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado  

      t.timestamps
    end
  end
end
