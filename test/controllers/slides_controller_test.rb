require 'test_helper'

class SlidesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get slides_new_url
    assert_response :success
  end

  test "should get create" do
    get slides_create_url
    assert_response :success
  end

  test "should get edit" do
    get slides_edit_url
    assert_response :success
  end

  test "should get update" do
    get slides_update_url
    assert_response :success
  end

  test "should get destroy" do
    get slides_destroy_url
    assert_response :success
  end

end
