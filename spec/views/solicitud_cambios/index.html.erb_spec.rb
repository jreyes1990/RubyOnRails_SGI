require 'rails_helper'

RSpec.describe "solicitud_cambios/index", type: :view do
  before(:each) do
    assign(:solicitud_cambios, [
      SolicitudCambio.create!(
        descripcion: "Descripcion",
        estado_documento_id: 2,
        etapa_solicitud_id: 3,
        user_created_id: 4,
        user_updated_id: 5,
        estado: "Estado",
        documento: nil
      ),
      SolicitudCambio.create!(
        descripcion: "Descripcion",
        estado_documento_id: 2,
        etapa_solicitud_id: 3,
        user_created_id: 4,
        user_updated_id: 5,
        estado: "Estado",
        documento: nil
      )
    ])
  end

  it "renders a list of solicitud_cambios" do
    render
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
