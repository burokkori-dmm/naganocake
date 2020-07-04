require 'test_helper'

class Public::CartsItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_carts_items_index_url
    assert_response :success
  end

end
