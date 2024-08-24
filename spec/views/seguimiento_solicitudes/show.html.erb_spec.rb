require 'rails_helper'

RSpec.describe "seguimiento_solicitudes/show", type: :view do
  before(:each) do
    @seguimiento_solicitud = assign(:seguimiento_solicitud, SeguimientoSolicitud.create!(
      version: 2,
      descripcion: "Descripcion",
      estado_documento_id: 3,
      etapa_seguimiento_id: 4,
      user_created_id: 5,
      user_updated_id: 6,
      estado: "Estado",
      solicitud_cambio: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Descripcion/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(//)
  end
end
