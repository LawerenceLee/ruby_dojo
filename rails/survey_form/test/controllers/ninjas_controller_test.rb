require 'test_helper'

class NinjasControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
