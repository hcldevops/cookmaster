require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get support" do
    get :support
    assert_response :success
  end

end
