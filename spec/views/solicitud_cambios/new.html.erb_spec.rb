require 'rails_helper'

RSpec.describe "solicitud_cambios/new", type: :view do
  before(:each) do
    assign(:solicitud_cambio, SolicitudCambio.new(
      descripcion: "MyString",
      estado_documento_id: 1,
      etapa_solicitud_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString",
      documento: nil
    ))
  end

  it "renders new solicitud_cambio form" do
    render

    assert_select "form[action=?][method=?]", solicitud_cambios_path, "post" do

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
