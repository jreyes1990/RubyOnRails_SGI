require 'rails_helper'

RSpec.describe "tipo_documentos/index", type: :view do
  before(:each) do
    assign(:tipo_documentos, [
      TipoDocumento.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        abreviatura: "Abreviatura",
        empresa_id: 2,
        user_created_id: 3,
        user_updated_id: 4,
        estado: "Estado"
      ),
      TipoDocumento.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        abreviatura: "Abreviatura",
        empresa_id: 2,
        user_created_id: 3,
        user_updated_id: 4,
        estado: "Estado"
      )
    ])
  end

  it "renders a list of tipo_documentos" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: "Abreviatura".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
  end
end
