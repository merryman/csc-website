require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  test "should get blueprint" do
    get :blueprint
    assert_response :success
  end

  test "should get link" do
    get :link
    assert_response :success
  end

end
