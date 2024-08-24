require 'rails_helper'

RSpec.describe "proveedores/index", type: :view do
  before(:each) do
    assign(:proveedores, [
      Proveedor.create!(
        nombre: "Nombre",
        direccion: "Direccion",
        telefono_empresa: 2,
        extension: 3,
        nombre_contacto: "Nombre Contacto",
        telefono_contacto: 4,
        descripcion: "Descripcion",
        estado: "Estado",
        area_id: 5,
        user_created_id: 6,
        user_updated_id: 7
      ),
      Proveedor.create!(
        nombre: "Nombre",
        direccion: "Direccion",
        telefono_empresa: 2,
        extension: 3,
        nombre_contacto: "Nombre Contacto",
        telefono_contacto: 4,
        descripcion: "Descripcion",
        estado: "Estado",
        area_id: 5,
        user_created_id: 6,
        user_updated_id: 7
      )
    ])
  end

  it "renders a list of proveedores" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Direccion".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Nombre Contacto".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: 7.to_s, count: 2
  end
end
