require 'test_helper'

class OrdenTrabajosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orden_trabajos_index_url
    assert_response :success
  end

end
