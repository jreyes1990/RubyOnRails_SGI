require 'rails_helper'

RSpec.describe "etapa_solicitudes/index", type: :view do
  before(:each) do
    assign(:etapa_solicitudes, [
      EtapaSolicitud.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        empresa_id: 2,
        user_created_id: 3,
        user_updated_id: 4,
        estado: "Estado"
      ),
      EtapaSolicitud.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        empresa_id: 2,
        user_created_id: 3,
        user_updated_id: 4,
        estado: "Estado"
      )
    ])
  end

  it "renders a list of etapa_solicitudes" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
  end
end
