require "application_system_test_case"

class TipoCombosTest < ApplicationSystemTestCase
  setup do
    @tipo_combo = tipo_combos(:one)
  end

  test "visiting the index" do
    visit tipo_combos_url
    assert_selector "h1", text: "Tipo Combos"
  end

  test "creating a Tipo combo" do
    visit tipo_combos_url
    click_on "New Tipo Combo"

    fill_in "Area", with: @tipo_combo.area_id
    fill_in "Descripcion", with: @tipo_combo.descripcion
    fill_in "Estado", with: @tipo_combo.estado
    fill_in "Nombre", with: @tipo_combo.nombre
    fill_in "User create", with: @tipo_combo.user_created_id
    fill_in "User update", with: @tipo_combo.user_updated_id
    click_on "Create Tipo combo"

    assert_text "Tipo combo was successfully created"
    click_on "Back"
  end

  test "updating a Tipo combo" do
    visit tipo_combos_url
    click_on "Edit", match: :first

    fill_in "Area", with: @tipo_combo.area_id
    fill_in "Descripcion", with: @tipo_combo.descripcion
    fill_in "Estado", with: @tipo_combo.estado
    fill_in "Nombre", with: @tipo_combo.nombre
    fill_in "User create", with: @tipo_combo.user_created_id
    fill_in "User update", with: @tipo_combo.user_updated_id
    click_on "Update Tipo combo"

    assert_text "Tipo combo was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo combo" do
    visit tipo_combos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo combo was successfully destroyed"
  end
end
