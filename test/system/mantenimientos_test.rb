require "application_system_test_case"

class MantenimientosTest < ApplicationSystemTestCase
  setup do
    @mantenimiento = mantenimientos(:one)
  end

  test "visiting the index" do
    visit mantenimientos_url
    assert_selector "h1", text: "Mantenimientos"
  end

  test "creating a Mantenimiento" do
    visit mantenimientos_url
    click_on "New Mantenimiento"

    fill_in "Area", with: @mantenimiento.area_id
    fill_in "Descripcion", with: @mantenimiento.descripcion
    fill_in "Estado", with: @mantenimiento.estado
    fill_in "Tipo equipo", with: @mantenimiento.tipo_equipo_id
    fill_in "Tipo mantenimiento", with: @mantenimiento.tipo_mantenimiento_id
    fill_in "User create", with: @mantenimiento.user_created_id
    fill_in "User update", with: @mantenimiento.user_updated_id
    click_on "Create Mantenimiento"

    assert_text "Mantenimiento was successfully created"
    click_on "Back"
  end

  test "updating a Mantenimiento" do
    visit mantenimientos_url
    click_on "Edit", match: :first

    fill_in "Area", with: @mantenimiento.area_id
    fill_in "Descripcion", with: @mantenimiento.descripcion
    fill_in "Estado", with: @mantenimiento.estado
    fill_in "Tipo equipo", with: @mantenimiento.tipo_equipo_id
    fill_in "Tipo mantenimiento", with: @mantenimiento.tipo_mantenimiento_id
    fill_in "User create", with: @mantenimiento.user_created_id
    fill_in "User update", with: @mantenimiento.user_updated_id
    click_on "Update Mantenimiento"

    assert_text "Mantenimiento was successfully updated"
    click_on "Back"
  end

  test "destroying a Mantenimiento" do
    visit mantenimientos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mantenimiento was successfully destroyed"
  end
end
