class CreateOpcionCas < ActiveRecord::Migration[6.0]
  def change
    create_table :opcion_cas do |t|
      t.references :opcion, null: false, foreign_key: true
      t.references :componente, null: false, foreign_key: true
      t.references :atributo, null: false, foreign_key: true
      t.string :descripcion            
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado  

      t.timestamps
    end
  end
end
