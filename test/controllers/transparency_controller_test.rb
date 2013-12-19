require 'test_helper'

class TransparencyControllerTest < ActionController::TestCase
  test "should get agendas" do
    get :agendas
    assert_response :success
  end

  test "should get minutes" do
    get :minutes
    assert_response :success
  end

  test "should get budgets" do
    get :budgets
    assert_response :success
  end

  test "should get constitution" do
    get :constitution
    assert_response :success
  end

  test "should get history" do
    get :history
    assert_response :success
  end

end
