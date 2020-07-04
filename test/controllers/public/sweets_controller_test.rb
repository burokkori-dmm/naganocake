require 'test_helper'

class Public::SweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_sweets_index_url
    assert_response :success
  end

  test "should get show" do
    get public_sweets_show_url
    assert_response :success
  end

end
