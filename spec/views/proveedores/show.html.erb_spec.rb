require 'rails_helper'

RSpec.describe "proveedores/show", type: :view do
  before(:each) do
    @proveedor = assign(:proveedor, Proveedor.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Direccion/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Nombre Contacto/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Descripcion/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
  end
end
