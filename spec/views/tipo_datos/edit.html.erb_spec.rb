require 'rails_helper'

RSpec.describe "tipo_datos/edit", type: :view do
  before(:each) do
    @tipo_dato = assign(:tipo_dato, TipoDato.create!(
      nombre: "MyString",
      descripcion: "MyString",
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders the edit tipo_dato form" do
    render

    assert_select "form[action=?][method=?]", tipo_dato_path(@tipo_dato), "post" do

      assert_select "input[name=?]", "tipo_dato[nombre]"

      assert_select "input[name=?]", "tipo_dato[descripcion]"

      assert_select "input[name=?]", "tipo_dato[user_created_id]"

      assert_select "input[name=?]", "tipo_dato[user_updated_id]"

      assert_select "input[name=?]", "tipo_dato[estado]"
    end
  end
end
