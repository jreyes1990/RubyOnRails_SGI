require 'rails_helper'

RSpec.describe "documentos/index", type: :view do
  before(:each) do
    assign(:documentos, [
      Documento.create!(
        codigo: "Codigo",
        correlativo: 2,
        nombre: "Nombre",
        version: 3,
        descripcion: "Descripcion",
        empresa_id: 4,
        estado_documento_id: 5,
        user_created_id: 6,
        user_updated_id: 7,
        estado: "Estado",
        proceso: nil,
        tipo_sistema: nil,
        tipo_documento: nil
      ),
      Documento.create!(
        codigo: "Codigo",
        correlativo: 2,
        nombre: "Nombre",
        version: 3,
        descripcion: "Descripcion",
        empresa_id: 4,
        estado_documento_id: 5,
        user_created_id: 6,
        user_updated_id: 7,
        estado: "Estado",
        proceso: nil,
        tipo_sistema: nil,
        tipo_documento: nil
      )
    ])
  end

  it "renders a list of documentos" do
    render
    assert_select "tr>td", text: "Codigo".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: 7.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
