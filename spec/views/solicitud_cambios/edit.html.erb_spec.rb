require 'rails_helper'

RSpec.describe "solicitud_cambios/edit", type: :view do
  before(:each) do
    @solicitud_cambio = assign(:solicitud_cambio, SolicitudCambio.create!(
      descripcion: "MyString",
      estado_documento_id: 1,
      etapa_solicitud_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString",
      documento: nil
    ))
  end

  it "renders the edit solicitud_cambio form" do
    render

    assert_select "form[action=?][method=?]", solicitud_cambio_path(@solicitud_cambio), "post" do

      assert_select "input[name=?]", "solicitud_cambio[descripcion]"

      assert_select "input[name=?]", "solicitud_cambio[estado_documento_id]"

      assert_select "input[name=?]", "solicitud_cambio[etapa_solicitud_id]"

      assert_select "input[name=?]", "solicitud_cambio[user_created_id]"

      assert_select "input[name=?]", "solicitud_cambio[user_updated_id]"

      assert_select "input[name=?]", "solicitud_cambio[estado]"

      assert_select "input[name=?]", "solicitud_cambio[documento_id]"
    end
  end
end
