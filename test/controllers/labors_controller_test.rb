require 'test_helper'

class LaborsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labor = labors(:one)
  end

  test "should get index" do
    get labors_url
    assert_response :success
  end

  test "should get new" do
    get new_labor_url
    assert_response :success
  end

  test "should create labor" do
    assert_difference('Labor.count') do
      post labors_url, params: { labor: { area_id: @labor.area_id, descripcion: @labor.descripcion, estado: @labor.estado, nombre: @labor.nombre, numero_personas: @labor.numero_personas, tiempo: @labor.tiempo, user_created_id: @labor.user_created_id, user_updated_id: @labor.user_updated_id } }
    end

    assert_redirected_to labor_url(Labor.last)
  end

  test "should show labor" do
    get labor_url(@labor)
    assert_response :success
  end

  test "should get edit" do
    get edit_labor_url(@labor)
    assert_response :success
  end

  test "should update labor" do
    patch labor_url(@labor), params: { labor: { area_id: @labor.area_id, descripcion: @labor.descripcion, estado: @labor.estado, nombre: @labor.nombre, numero_personas: @labor.numero_personas, tiempo: @labor.tiempo, user_created_id: @labor.user_created_id, user_updated_id: @labor.user_updated_id } }
    assert_redirected_to labor_url(@labor)
  end

  test "should destroy labor" do
    assert_difference('Labor.count', -1) do
      delete labor_url(@labor)
    end

    assert_redirected_to labors_url
  end
end
