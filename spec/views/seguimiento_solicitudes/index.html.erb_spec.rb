require 'rails_helper'

RSpec.describe "seguimiento_solicitudes/index", type: :view do
  before(:each) do
    assign(:seguimiento_solicitudes, [
      SeguimientoSolicitud.create!(
        version: 2,
        descripcion: "Descripcion",
        estado_documento_id: 3,
        etapa_seguimiento_id: 4,
        user_created_id: 5,
        user_updated_id: 6,
        estado: "Estado",
        solicitud_cambio: nil
      ),
      SeguimientoSolicitud.create!(
        version: 2,
        descripcion: "Descripcion",
        estado_documento_id: 3,
        etapa_seguimiento_id: 4,
        user_created_id: 5,
        user_updated_id: 6,
        estado: "Estado",
        solicitud_cambio: nil
      )
    ])
  end

  it "renders a list of seguimiento_solicitudes" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
