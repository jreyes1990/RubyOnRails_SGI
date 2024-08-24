require 'rails_helper'

RSpec.describe "tipo_usuarios/new", type: :view do
  before(:each) do
    assign(:tipo_usuario, TipoUsuario.new(
      nombre: "MyString",
      descripcion: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new tipo_usuario form" do
    render

    assert_select "form[action=?][method=?]", tipo_usuarios_path, "post" do

      assert_select "input[name=?]", "tipo_usuario[nombre]"

      assert_select "input[name=?]", "tipo_usuario[descripcion]"

      assert_select "input[name=?]", "tipo_usuario[empresa_id]"

      assert_select "input[name=?]", "tipo_usuario[user_created_id]"

      assert_select "input[name=?]", "tipo_usuario[user_updated_id]"

      assert_select "input[name=?]", "tipo_usuario[estado]"
    end
  end
end
