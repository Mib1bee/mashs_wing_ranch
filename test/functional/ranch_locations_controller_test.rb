require 'test_helper'

class RanchLocationsControllerTest < ActionController::TestCase
  test "should get locations" do
    get :locations
    assert_response :success
  end

end
