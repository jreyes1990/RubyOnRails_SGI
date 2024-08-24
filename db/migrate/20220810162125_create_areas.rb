class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :nombre
      t.string :descripcion
      t.references :empresa, null: false, foreign_key: true
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado

      
      t.timestamps
    end
  end
end
