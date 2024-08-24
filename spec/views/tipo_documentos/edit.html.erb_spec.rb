require 'rails_helper'

RSpec.describe "tipo_documentos/edit", type: :view do
  before(:each) do
    @tipo_documento = assign(:tipo_documento, TipoDocumento.create!(
      nombre: "MyString",
      descripcion: "MyString",
      abreviatura: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders the edit tipo_documento form" do
    render

    assert_select "form[action=?][method=?]", tipo_documento_path(@tipo_documento), "post" do

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
