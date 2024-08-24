require "application_system_test_case"

class TipoMantenimientosTest < ApplicationSystemTestCase
  setup do
    @tipo_mantenimiento = tipo_mantenimientos(:one)
  end

  test "visiting the index" do
    visit tipo_mantenimientos_url
    assert_selector "h1", text: "Tipo Mantenimientos"
  end

  test "creating a Tipo mantenimiento" do
    visit tipo_mantenimientos_url
    click_on "New Tipo Mantenimiento"

    fill_in "Area", with: @tipo_mantenimiento.area_id
    fill_in "Descripcion", with: @tipo_mantenimiento.descripcion
    fill_in "Estado", with: @tipo_mantenimiento.estado
    fill_in "Nombre", with: @tipo_mantenimiento.nombre
    fill_in "User create", with: @tipo_mantenimiento.user_created_id
    fill_in "User update", with: @tipo_mantenimiento.user_updated_id
    click_on "Create Tipo mantenimiento"

    assert_text "Tipo mantenimiento was successfully created"
    click_on "Back"
  end

  test "updating a Tipo mantenimiento" do
    visit tipo_mantenimientos_url
    click_on "Edit", match: :first

    fill_in "Area", with: @tipo_mantenimiento.area_id
    fill_in "Descripcion", with: @tipo_mantenimiento.descripcion
    fill_in "Estado", with: @tipo_mantenimiento.estado
    fill_in "Nombre", with: @tipo_mantenimiento.nombre
    fill_in "User create", with: @tipo_mantenimiento.user_created_id
    fill_in "User update", with: @tipo_mantenimiento.user_updated_id
    click_on "Update Tipo mantenimiento"

    assert_text "Tipo mantenimiento was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo mantenimiento" do
    visit tipo_mantenimientos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo mantenimiento was successfully destroyed"
  end
end
