require 'test_helper'

class TipoTransaccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_transaccion = tipo_transaccions(:one)
  end

  test "should get index" do
    get tipo_transaccions_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_transaccion_url
    assert_response :success
  end

  test "should create tipo_transaccion" do
    assert_difference('TipoTransaccion.count') do
      post tipo_transaccions_url, params: { tipo_transaccion: { area_id: @tipo_transaccion.area_id, descripcion: @tipo_transaccion.descripcion, estado: @tipo_transaccion.estado, nombre: @tipo_transaccion.nombre, user_created_id: @tipo_transaccion.user_created_id, user_updated_id: @tipo_transaccion.user_updated_id } }
    end

    assert_redirected_to tipo_transaccion_url(TipoTransaccion.last)
  end

  test "should show tipo_transaccion" do
    get tipo_transaccion_url(@tipo_transaccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_transaccion_url(@tipo_transaccion)
    assert_response :success
  end

  test "should update tipo_transaccion" do
    patch tipo_transaccion_url(@tipo_transaccion), params: { tipo_transaccion: { area_id: @tipo_transaccion.area_id, descripcion: @tipo_transaccion.descripcion, estado: @tipo_transaccion.estado, nombre: @tipo_transaccion.nombre, user_created_id: @tipo_transaccion.user_created_id, user_updated_id: @tipo_transaccion.user_updated_id } }
    assert_redirected_to tipo_transaccion_url(@tipo_transaccion)
  end

  test "should destroy tipo_transaccion" do
    assert_difference('TipoTransaccion.count', -1) do
      delete tipo_transaccion_url(@tipo_transaccion)
    end

    assert_redirected_to tipo_transaccions_url
  end
end
