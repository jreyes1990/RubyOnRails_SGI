require 'test_helper'

class TipoMantenimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_mantenimiento = tipo_mantenimientos(:one)
  end

  test "should get index" do
    get tipo_mantenimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_mantenimiento_url
    assert_response :success
  end

  test "should create tipo_mantenimiento" do
    assert_difference('TipoMantenimiento.count') do
      post tipo_mantenimientos_url, params: { tipo_mantenimiento: { area_id: @tipo_mantenimiento.area_id, descripcion: @tipo_mantenimiento.descripcion, estado: @tipo_mantenimiento.estado, nombre: @tipo_mantenimiento.nombre, user_created_id: @tipo_mantenimiento.user_created_id, user_updated_id: @tipo_mantenimiento.user_updated_id } }
    end

    assert_redirected_to tipo_mantenimiento_url(TipoMantenimiento.last)
  end

  test "should show tipo_mantenimiento" do
    get tipo_mantenimiento_url(@tipo_mantenimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_mantenimiento_url(@tipo_mantenimiento)
    assert_response :success
  end

  test "should update tipo_mantenimiento" do
    patch tipo_mantenimiento_url(@tipo_mantenimiento), params: { tipo_mantenimiento: { area_id: @tipo_mantenimiento.area_id, descripcion: @tipo_mantenimiento.descripcion, estado: @tipo_mantenimiento.estado, nombre: @tipo_mantenimiento.nombre, user_created_id: @tipo_mantenimiento.user_created_id, user_updated_id: @tipo_mantenimiento.user_updated_id } }
    assert_redirected_to tipo_mantenimiento_url(@tipo_mantenimiento)
  end

  test "should destroy tipo_mantenimiento" do
    assert_difference('TipoMantenimiento.count', -1) do
      delete tipo_mantenimiento_url(@tipo_mantenimiento)
    end

    assert_redirected_to tipo_mantenimientos_url
  end
end
