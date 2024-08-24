class CreateParametros < ActiveRecord::Migration[6.0]
  def change
    create_table :parametros do |t|
      t.references :user, null: false, foreign_key: true           
      t.string :view_default

      t.timestamps
    end
  end
end
