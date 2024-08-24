class CreateEmpresas < ActiveRecord::Migration[6.0]
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :codigo_empresa      
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado      
      t.timestamps
    end
  end
end
