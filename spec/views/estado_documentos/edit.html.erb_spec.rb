require 'rails_helper'

RSpec.describe "estado_documentos/edit", type: :view do
  before(:each) do
    @estado_documento = assign(:estado_documento, EstadoDocumento.create!(
      nombre: "MyString",
      descripcion: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString",
      etapa_documento: nil
    ))
  end

  it "renders the edit estado_documento form" do
    render

    assert_select "form[action=?][method=?]", estado_documento_path(@estado_documento), "post" do

      assert_select "input[name=?]", "estado_documento[nombre]"

      assert_select "input[name=?]", "estado_documento[descripcion]"

      assert_select "input[name=?]", "estado_documento[empresa_id]"

      assert_select "input[name=?]", "estado_documento[user_created_id]"

      assert_select "input[name=?]", "estado_documento[user_updated_id]"

      assert_select "input[name=?]", "estado_documento[estado]"

      assert_select "input[name=?]", "estado_documento[etapa_documento_id]"
    end
  end
end
