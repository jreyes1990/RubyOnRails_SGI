require 'rails_helper'

RSpec.describe "tipo_sistemas/new", type: :view do
  before(:each) do
    assign(:tipo_sistema, TipoSistema.new(
      nombre: "MyString",
      descripcion: "MyString",
      abreviatura: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new tipo_sistema form" do
    render

    assert_select "form[action=?][method=?]", tipo_sistemas_path, "post" do

      assert_select "input[name=?]", "tipo_sistema[nombre]"

      assert_select "input[name=?]", "tipo_sistema[descripcion]"

      assert_select "input[name=?]", "tipo_sistema[abreviatura]"

      assert_select "input[name=?]", "tipo_sistema[empresa_id]"

      assert_select "input[name=?]", "tipo_sistema[user_created_id]"

      assert_select "input[name=?]", "tipo_sistema[user_updated_id]"

      assert_select "input[name=?]", "tipo_sistema[estado]"
    end
  end
end
