require 'test_helper'

class Public::DeliverysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_deliverys_index_url
    assert_response :success
  end

end
