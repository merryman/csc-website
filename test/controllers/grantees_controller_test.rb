require 'test_helper'

class GranteesControllerTest < ActionController::TestCase
  test "should get proposal" do
    get :proposal
    assert_response :success
  end

  test "should get training" do
    get :training
    assert_response :success
  end

  test "should get criteria" do
    get :criteria
    assert_response :success
  end

end
