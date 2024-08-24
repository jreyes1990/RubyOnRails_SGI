require 'test_helper'

class EstadoOrdenTrabajosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado_orden_trabajo = estado_orden_trabajos(:one)
  end

  test "should get index" do
    get estado_orden_trabajos_url
    assert_response :success
  end

  test "should get new" do
    get new_estado_orden_trabajo_url
    assert_response :success
  end

  test "should create estado_orden_trabajo" do
    assert_difference('EstadoOrdenTrabajo.count') do
      post estado_orden_trabajos_url, params: { estado_orden_trabajo: { area_id: @estado_orden_trabajo.area_id, descripcion: @estado_orden_trabajo.descripcion, estado: @estado_orden_trabajo.estado, nombre: @estado_orden_trabajo.nombre, user_created_id: @estado_orden_trabajo.user_created_id, user_updated_id: @estado_orden_trabajo.user_updated_id } }
    end

    assert_redirected_to estado_orden_trabajo_url(EstadoOrdenTrabajo.last)
  end

  test "should show estado_orden_trabajo" do
    get estado_orden_trabajo_url(@estado_orden_trabajo)
    assert_response :success
  end

  test "should get edit" do
    get edit_estado_orden_trabajo_url(@estado_orden_trabajo)
    assert_response :success
  end

  test "should update estado_orden_trabajo" do
    patch estado_orden_trabajo_url(@estado_orden_trabajo), params: { estado_orden_trabajo: { area_id: @estado_orden_trabajo.area_id, descripcion: @estado_orden_trabajo.descripcion, estado: @estado_orden_trabajo.estado, nombre: @estado_orden_trabajo.nombre, user_created_id: @estado_orden_trabajo.user_created_id, user_updated_id: @estado_orden_trabajo.user_updated_id } }
    assert_redirected_to estado_orden_trabajo_url(@estado_orden_trabajo)
  end

  test "should destroy estado_orden_trabajo" do
    assert_difference('EstadoOrdenTrabajo.count', -1) do
      delete estado_orden_trabajo_url(@estado_orden_trabajo)
    end

    assert_redirected_to estado_orden_trabajos_url
  end
end
