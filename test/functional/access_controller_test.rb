require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get admin_index" do
    get :admin_index
    assert_response :success
  end

end
