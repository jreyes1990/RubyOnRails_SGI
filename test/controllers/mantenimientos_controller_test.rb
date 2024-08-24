require 'test_helper'

class MantenimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mantenimiento = mantenimientos(:one)
  end

  test "should get index" do
    get mantenimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_mantenimiento_url
    assert_response :success
  end

  test "should create mantenimiento" do
    assert_difference('Mantenimiento.count') do
      post mantenimientos_url, params: { mantenimiento: { area_id: @mantenimiento.area_id, descripcion: @mantenimiento.descripcion, estado: @mantenimiento.estado, tipo_equipo_id: @mantenimiento.tipo_equipo_id, tipo_mantenimiento_id: @mantenimiento.tipo_mantenimiento_id, user_created_id: @mantenimiento.user_created_id, user_updated_id: @mantenimiento.user_updated_id } }
    end

    assert_redirected_to mantenimiento_url(Mantenimiento.last)
  end

  test "should show mantenimiento" do
    get mantenimiento_url(@mantenimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_mantenimiento_url(@mantenimiento)
    assert_response :success
  end

  test "should update mantenimiento" do
    patch mantenimiento_url(@mantenimiento), params: { mantenimiento: { area_id: @mantenimiento.area_id, descripcion: @mantenimiento.descripcion, estado: @mantenimiento.estado, tipo_equipo_id: @mantenimiento.tipo_equipo_id, tipo_mantenimiento_id: @mantenimiento.tipo_mantenimiento_id, user_created_id: @mantenimiento.user_created_id, user_updated_id: @mantenimiento.user_updated_id } }
    assert_redirected_to mantenimiento_url(@mantenimiento)
  end

  test "should destroy mantenimiento" do
    assert_difference('Mantenimiento.count', -1) do
      delete mantenimiento_url(@mantenimiento)
    end

    assert_redirected_to mantenimientos_url
  end
end
