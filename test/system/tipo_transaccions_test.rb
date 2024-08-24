require "application_system_test_case"

class TipoTransaccionsTest < ApplicationSystemTestCase
  setup do
    @tipo_transaccion = tipo_transaccions(:one)
  end

  test "visiting the index" do
    visit tipo_transaccions_url
    assert_selector "h1", text: "Tipo Transaccions"
  end

  test "creating a Tipo transaccion" do
    visit tipo_transaccions_url
    click_on "New Tipo Transaccion"

    fill_in "Area", with: @tipo_transaccion.area_id
    fill_in "Descripcion", with: @tipo_transaccion.descripcion
    fill_in "Estado", with: @tipo_transaccion.estado
    fill_in "Nombre", with: @tipo_transaccion.nombre
    fill_in "User create", with: @tipo_transaccion.user_created_id
    fill_in "User update", with: @tipo_transaccion.user_updated_id
    click_on "Create Tipo transaccion"

    assert_text "Tipo transaccion was successfully created"
    click_on "Back"
  end

  test "updating a Tipo transaccion" do
    visit tipo_transaccions_url
    click_on "Edit", match: :first

    fill_in "Area", with: @tipo_transaccion.area_id
    fill_in "Descripcion", with: @tipo_transaccion.descripcion
    fill_in "Estado", with: @tipo_transaccion.estado
    fill_in "Nombre", with: @tipo_transaccion.nombre
    fill_in "User create", with: @tipo_transaccion.user_created_id
    fill_in "User update", with: @tipo_transaccion.user_updated_id
    click_on "Update Tipo transaccion"

    assert_text "Tipo transaccion was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo transaccion" do
    visit tipo_transaccions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo transaccion was successfully destroyed"
  end
end
