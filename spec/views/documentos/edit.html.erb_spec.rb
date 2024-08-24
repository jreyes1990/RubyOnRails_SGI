require 'rails_helper'

RSpec.describe "documentos/edit", type: :view do
  before(:each) do
    @documento = assign(:documento, Documento.create!(
      codigo: "MyString",
      correlativo: 1,
      nombre: "MyString",
      version: 1,
      descripcion: "MyString",
      empresa_id: 1,
      estado_documento_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString",
      proceso: nil,
      tipo_sistema: nil,
      tipo_documento: nil
    ))
  end

  it "renders the edit documento form" do
    render

    assert_select "form[action=?][method=?]", documento_path(@documento), "post" do

      assert_select "input[name=?]", "documento[codigo]"

      assert_select "input[name=?]", "documento[correlativo]"

      assert_select "input[name=?]", "documento[nombre]"

      assert_select "input[name=?]", "documento[version]"

      assert_select "input[name=?]", "documento[descripcion]"

      assert_select "input[name=?]", "documento[empresa_id]"

      assert_select "input[name=?]", "documento[estado_documento_id]"

      assert_select "input[name=?]", "documento[user_created_id]"

      assert_select "input[name=?]", "documento[user_updated_id]"

      assert_select "input[name=?]", "documento[estado]"

      assert_select "input[name=?]", "documento[proceso_id]"

      assert_select "input[name=?]", "documento[tipo_sistema_id]"

      assert_select "input[name=?]", "documento[tipo_documento_id]"
    end
  end
end
