require 'rails_helper'

RSpec.describe "tipo_documentos/new", type: :view do
  before(:each) do
    assign(:tipo_documento, TipoDocumento.new(
      nombre: "MyString",
      descripcion: "MyString",
      abreviatura: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new tipo_documento form" do
    render

    assert_select "form[action=?][method=?]", tipo_documentos_path, "post" do

      assert_select "input[name=?]", "tipo_documento[nombre]"

      assert_select "input[name=?]", "tipo_documento[descripcion]"

      assert_select "input[name=?]", "tipo_documento[abreviatura]"

      assert_select "input[name=?]", "tipo_documento[empresa_id]"

      assert_select "input[name=?]", "tipo_documento[user_created_id]"

      assert_select "input[name=?]", "tipo_documento[user_updated_id]"

      assert_select "input[name=?]", "tipo_documento[estado]"
    end
  end
end
