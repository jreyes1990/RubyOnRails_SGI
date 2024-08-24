require 'rails_helper'

RSpec.describe "etapa_documentos/index", type: :view do
  before(:each) do
    assign(:etapa_documentos, [
      EtapaDocumento.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        user_created_id: 2,
        user_updated_id: 3,
        estado: "Estado"
      ),
      EtapaDocumento.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        user_created_id: 2,
        user_updated_id: 3,
        estado: "Estado"
      )
    ])
  end

  it "renders a list of etapa_documentos" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
  end
end
