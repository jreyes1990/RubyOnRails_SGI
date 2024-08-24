require "application_system_test_case"

class EstadoOrdenTrabajosTest < ApplicationSystemTestCase
  setup do
    @estado_orden_trabajo = estado_orden_trabajos(:one)
  end

  test "visiting the index" do
    visit estado_orden_trabajos_url
    assert_selector "h1", text: "Estado Orden Trabajos"
  end

  test "creating a Estado orden trabajo" do
    visit estado_orden_trabajos_url
    click_on "New Estado Orden Trabajo"

    fill_in "Area", with: @estado_orden_trabajo.area_id
    fill_in "Descripcion", with: @estado_orden_trabajo.descripcion
    fill_in "Estado", with: @estado_orden_trabajo.estado
    fill_in "Nombre", with: @estado_orden_trabajo.nombre
    fill_in "User create", with: @estado_orden_trabajo.user_created_id
    fill_in "User update", with: @estado_orden_trabajo.user_updated_id
    click_on "Create Estado orden trabajo"

    assert_text "Estado orden trabajo was successfully created"
    click_on "Back"
  end

  test "updating a Estado orden trabajo" do
    visit estado_orden_trabajos_url
    click_on "Edit", match: :first

    fill_in "Area", with: @estado_orden_trabajo.area_id
    fill_in "Descripcion", with: @estado_orden_trabajo.descripcion
    fill_in "Estado", with: @estado_orden_trabajo.estado
    fill_in "Nombre", with: @estado_orden_trabajo.nombre
    fill_in "User create", with: @estado_orden_trabajo.user_created_id
    fill_in "User update", with: @estado_orden_trabajo.user_updated_id
    click_on "Update Estado orden trabajo"

    assert_text "Estado orden trabajo was successfully updated"
    click_on "Back"
  end

  test "destroying a Estado orden trabajo" do
    visit estado_orden_trabajos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estado orden trabajo was successfully destroyed"
  end
end
