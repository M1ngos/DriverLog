require "test_helper"

class DriverDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get driver_dashboard_index_url
    assert_response :success
  end
end
