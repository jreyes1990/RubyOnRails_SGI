require 'rails_helper'

RSpec.describe "etapa_documentos/edit", type: :view do
  before(:each) do
    @etapa_documento = assign(:etapa_documento, EtapaDocumento.create!(
      nombre: "MyString",
      descripcion: "MyString",
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders the edit etapa_documento form" do
    render

    assert_select "form[action=?][method=?]", etapa_documento_path(@etapa_documento), "post" do

      assert_select "input[name=?]", "etapa_documento[nombre]"

      assert_select "input[name=?]", "etapa_documento[descripcion]"

      assert_select "input[name=?]", "etapa_documento[user_created_id]"

      assert_select "input[name=?]", "etapa_documento[user_updated_id]"

      assert_select "input[name=?]", "etapa_documento[estado]"
    end
  end
end
