require 'test_helper'

class SessionsLoginTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
  end
end
