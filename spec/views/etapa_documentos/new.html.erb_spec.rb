require 'rails_helper'

RSpec.describe "etapa_documentos/new", type: :view do
  before(:each) do
    assign(:etapa_documento, EtapaDocumento.new(
      nombre: "MyString",
      descripcion: "MyString",
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new etapa_documento form" do
    render

    assert_select "form[action=?][method=?]", etapa_documentos_path, "post" do

      assert_select "input[name=?]", "etapa_documento[nombre]"

      assert_select "input[name=?]", "etapa_documento[descripcion]"

      assert_select "input[name=?]", "etapa_documento[user_created_id]"

      assert_select "input[name=?]", "etapa_documento[user_updated_id]"

      assert_select "input[name=?]", "etapa_documento[estado]"
    end
  end
end
