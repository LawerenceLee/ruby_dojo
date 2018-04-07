require 'test_helper'

class FriendshipControllerTest < ActionController::TestCase
  test "should get user_id:integerfriend_id:integer" do
    get :user_id:integerfriend_id:integer
    assert_response :success
  end

end
