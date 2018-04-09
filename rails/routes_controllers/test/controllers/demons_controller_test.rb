require 'test_helper'

class DemonsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get say_joe" do
    get :say_joe
    assert_response :success
  end

  test "should get say_michael" do
    get :say_michael
    assert_response :success
  end

  test "should get times" do
    get :times
    assert_response :success
  end

  test "should get restart" do
    get :restart
    assert_response :success
  end

end
