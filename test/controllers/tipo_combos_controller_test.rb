require 'test_helper'

class TipoCombosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_combo = tipo_combos(:one)
  end

  test "should get index" do
    get tipo_combos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_combo_url
    assert_response :success
  end

  test "should create tipo_combo" do
    assert_difference('TipoCombo.count') do
      post tipo_combos_url, params: { tipo_combo: { area_id: @tipo_combo.area_id, descripcion: @tipo_combo.descripcion, estado: @tipo_combo.estado, nombre: @tipo_combo.nombre, user_created_id: @tipo_combo.user_created_id, user_updated_id: @tipo_combo.user_updated_id } }
    end

    assert_redirected_to tipo_combo_url(TipoCombo.last)
  end

  test "should show tipo_combo" do
    get tipo_combo_url(@tipo_combo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_combo_url(@tipo_combo)
    assert_response :success
  end

  test "should update tipo_combo" do
    patch tipo_combo_url(@tipo_combo), params: { tipo_combo: { area_id: @tipo_combo.area_id, descripcion: @tipo_combo.descripcion, estado: @tipo_combo.estado, nombre: @tipo_combo.nombre, user_created_id: @tipo_combo.user_created_id, user_updated_id: @tipo_combo.user_updated_id } }
    assert_redirected_to tipo_combo_url(@tipo_combo)
  end

  test "should destroy tipo_combo" do
    assert_difference('TipoCombo.count', -1) do
      delete tipo_combo_url(@tipo_combo)
    end

    assert_redirected_to tipo_combos_url
  end
end
