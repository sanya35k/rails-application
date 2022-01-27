require "test_helper"

class CarriagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carriages_index_url
    assert_response :success
  end
end
