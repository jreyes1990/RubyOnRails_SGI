require 'rails_helper'

RSpec.describe "proveedores/new", type: :view do
  before(:each) do
    assign(:proveedor, Proveedor.new(
      nombre: "MyString",
      direccion: "MyString",
      telefono_empresa: 1,
      extension: 1,
      nombre_contacto: "MyString",
      telefono_contacto: 1,
      descripcion: "MyString",
      estado: "MyString",
      area_id: 1,
      user_created_id: 1,
      user_updated_id: 1
    ))
  end

  it "renders new proveedor form" do
    render

    assert_select "form[action=?][method=?]", proveedores_path, "post" do

      assert_select "input[name=?]", "proveedor[nombre]"

      assert_select "input[name=?]", "proveedor[direccion]"

      assert_select "input[name=?]", "proveedor[telefono_empresa]"

      assert_select "input[name=?]", "proveedor[extension]"

      assert_select "input[name=?]", "proveedor[nombre_contacto]"

      assert_select "input[name=?]", "proveedor[telefono_contacto]"

      assert_select "input[name=?]", "proveedor[descripcion]"

      assert_select "input[name=?]", "proveedor[estado]"

      assert_select "input[name=?]", "proveedor[area_id]"

      assert_select "input[name=?]", "proveedor[user_created_id]"

      assert_select "input[name=?]", "proveedor[user_updated_id]"
    end
  end
end
