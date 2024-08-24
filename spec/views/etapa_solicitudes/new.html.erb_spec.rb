require 'rails_helper'

RSpec.describe "etapa_solicitudes/new", type: :view do
  before(:each) do
    assign(:etapa_solicitud, EtapaSolicitud.new(
      nombre: "MyString",
      descripcion: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new etapa_solicitud form" do
    render

    assert_select "form[action=?][method=?]", etapa_solicitudes_path, "post" do

      assert_select "input[name=?]", "etapa_solicitud[nombre]"

      assert_select "input[name=?]", "etapa_solicitud[descripcion]"

      assert_select "input[name=?]", "etapa_solicitud[empresa_id]"

      assert_select "input[name=?]", "etapa_solicitud[user_created_id]"

      assert_select "input[name=?]", "etapa_solicitud[user_updated_id]"

      assert_select "input[name=?]", "etapa_solicitud[estado]"
    end
  end
end
