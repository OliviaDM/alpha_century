require 'test_helper'

class CoordinatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get coordinates_new_url
    assert_response :success
  end

  test "should get create" do
    get coordinates_create_url
    assert_response :success
  end

  test "should get update" do
    get coordinates_update_url
    assert_response :success
  end

  test "should get destroy" do
    get coordinates_destroy_url
    assert_response :success
  end

end
