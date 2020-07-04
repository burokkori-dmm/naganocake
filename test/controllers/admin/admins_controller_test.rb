require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_admins_new_url
    assert_response :success
  end

end
