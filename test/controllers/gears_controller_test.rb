require "test_helper"

class GearsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gears_index_url
    assert_response :success
  end

  test "should get show" do
    get gears_show_url
    assert_response :success
  end

  test "should get new" do
    get gears_new_url
    assert_response :success
  end

  test "should get create" do
    get gears_create_url
    assert_response :success
  end
end
