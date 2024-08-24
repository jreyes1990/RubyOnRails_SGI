require 'rails_helper'

RSpec.describe "solicitud_cambios/show", type: :view do
  before(:each) do
    @solicitud_cambio = assign(:solicitud_cambio, SolicitudCambio.create!(
      descripcion: "Descripcion",
      estado_documento_id: 2,
      etapa_solicitud_id: 3,
      user_created_id: 4,
      user_updated_id: 5,
      estado: "Estado",
      documento: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descripcion/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(//)
  end
end
