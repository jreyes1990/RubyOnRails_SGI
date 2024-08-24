require 'rails_helper'

RSpec.describe "tipo_datos/new", type: :view do
  before(:each) do
    assign(:tipo_dato, TipoDato.new(
      nombre: "MyString",
      descripcion: "MyString",
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new tipo_dato form" do
    render

    assert_select "form[action=?][method=?]", tipo_datos_path, "post" do

      assert_select "input[name=?]", "tipo_dato[nombre]"

      assert_select "input[name=?]", "tipo_dato[descripcion]"

      assert_select "input[name=?]", "tipo_dato[user_created_id]"

      assert_select "input[name=?]", "tipo_dato[user_updated_id]"

      assert_select "input[name=?]", "tipo_dato[estado]"
    end
  end
end
