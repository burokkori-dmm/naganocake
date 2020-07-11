require 'test_helper'

class Admin::SweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sweets_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_sweets_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_sweets_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_sweets_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_sweets_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_sweets_update_url
    assert_response :success
  end

end
