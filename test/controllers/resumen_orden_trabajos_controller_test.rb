require 'test_helper'

class ResumenOrdenTrabajosControllerTest < ActionDispatch::IntegrationTest
  test "should get index_resumen" do
    get resumen_orden_trabajos_index_resumen_url
    assert_response :success
  end

end
