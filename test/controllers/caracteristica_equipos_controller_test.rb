require 'test_helper'

class CaracteristicaEquiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caracteristica_equipo = caracteristica_equipos(:one)
  end

  test "should get index" do
    get caracteristica_equipos_url
    assert_response :success
  end

  test "should get new" do
    get new_caracteristica_equipo_url
    assert_response :success
  end

  test "should create caracteristica_equipo" do
    assert_difference('CaracteristicaEquipo.count') do
      post caracteristica_equipos_url, params: { caracteristica_equipo: { area_id: @caracteristica_equipo.area_id, caracteristica_id: @caracteristica_equipo.caracteristica_id, estado: @caracteristica_equipo.estado, tipo_equipo_id: @caracteristica_equipo.tipo_equipo_id, user_created_id: @caracteristica_equipo.user_created_id, user_updated_id: @caracteristica_equipo.user_updated_id } }
    end

    assert_redirected_to caracteristica_equipo_url(CaracteristicaEquipo.last)
  end

  test "should show caracteristica_equipo" do
    get caracteristica_equipo_url(@caracteristica_equipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_caracteristica_equipo_url(@caracteristica_equipo)
    assert_response :success
  end

  test "should update caracteristica_equipo" do
    patch caracteristica_equipo_url(@caracteristica_equipo), params: { caracteristica_equipo: { area_id: @caracteristica_equipo.area_id, caracteristica_id: @caracteristica_equipo.caracteristica_id, estado: @caracteristica_equipo.estado, tipo_equipo_id: @caracteristica_equipo.tipo_equipo_id, user_created_id: @caracteristica_equipo.user_created_id, user_updated_id: @caracteristica_equipo.user_updated_id } }
    assert_redirected_to caracteristica_equipo_url(@caracteristica_equipo)
  end

  test "should destroy caracteristica_equipo" do
    assert_difference('CaracteristicaEquipo.count', -1) do
      delete caracteristica_equipo_url(@caracteristica_equipo)
    end

    assert_redirected_to caracteristica_equipos_url
  end
end
