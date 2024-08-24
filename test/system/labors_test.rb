require "application_system_test_case"

class LaborsTest < ApplicationSystemTestCase
  setup do
    @labor = labors(:one)
  end

  test "visiting the index" do
    visit labors_url
    assert_selector "h1", text: "Labors"
  end

  test "creating a Labor" do
    visit labors_url
    click_on "New Labor"

    fill_in "Area", with: @labor.area_id
    fill_in "Descripcion", with: @labor.descripcion
    fill_in "Estado", with: @labor.estado
    fill_in "Nombre", with: @labor.nombre
    fill_in "Numero personas", with: @labor.numero_personas
    fill_in "Tiempo", with: @labor.tiempo
    fill_in "User create", with: @labor.user_created_id
    fill_in "User update", with: @labor.user_updated_id
    click_on "Create Labor"

    assert_text "Labor was successfully created"
    click_on "Back"
  end

  test "updating a Labor" do
    visit labors_url
    click_on "Edit", match: :first

    fill_in "Area", with: @labor.area_id
    fill_in "Descripcion", with: @labor.descripcion
    fill_in "Estado", with: @labor.estado
    fill_in "Nombre", with: @labor.nombre
    fill_in "Numero personas", with: @labor.numero_personas
    fill_in "Tiempo", with: @labor.tiempo
    fill_in "User create", with: @labor.user_created_id
    fill_in "User update", with: @labor.user_updated_id
    click_on "Update Labor"

    assert_text "Labor was successfully updated"
    click_on "Back"
  end

  test "destroying a Labor" do
    visit labors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Labor was successfully destroyed"
  end
end
