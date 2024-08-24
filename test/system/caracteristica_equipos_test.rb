require "application_system_test_case"

class CaracteristicaEquiposTest < ApplicationSystemTestCase
  setup do
    @caracteristica_equipo = caracteristica_equipos(:one)
  end

  test "visiting the index" do
    visit caracteristica_equipos_url
    assert_selector "h1", text: "Caracteristica Equipos"
  end

  test "creating a Caracteristica equipo" do
    visit caracteristica_equipos_url
    click_on "New Caracteristica Equipo"

    fill_in "Area", with: @caracteristica_equipo.area_id
    fill_in "Caracteristica", with: @caracteristica_equipo.caracteristica_id
    fill_in "Estado", with: @caracteristica_equipo.estado
    fill_in "Tipo equipo", with: @caracteristica_equipo.tipo_equipo_id
    fill_in "User create", with: @caracteristica_equipo.user_created_id
    fill_in "User update", with: @caracteristica_equipo.user_updated_id
    click_on "Create Caracteristica equipo"

    assert_text "Caracteristica equipo was successfully created"
    click_on "Back"
  end

  test "updating a Caracteristica equipo" do
    visit caracteristica_equipos_url
    click_on "Edit", match: :first

    fill_in "Area", with: @caracteristica_equipo.area_id
    fill_in "Caracteristica", with: @caracteristica_equipo.caracteristica_id
    fill_in "Estado", with: @caracteristica_equipo.estado
    fill_in "Tipo equipo", with: @caracteristica_equipo.tipo_equipo_id
    fill_in "User create", with: @caracteristica_equipo.user_created_id
    fill_in "User update", with: @caracteristica_equipo.user_updated_id
    click_on "Update Caracteristica equipo"

    assert_text "Caracteristica equipo was successfully updated"
    click_on "Back"
  end

  test "destroying a Caracteristica equipo" do
    visit caracteristica_equipos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Caracteristica equipo was successfully destroyed"
  end
end
