require "test_helper"

class Drivers::ShiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get drivers_shifts_create_url
    assert_response :success
  end

  test "should get update" do
    get drivers_shifts_update_url
    assert_response :success
  end
end
