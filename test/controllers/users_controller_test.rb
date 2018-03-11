require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get register page" do
    get register_path
    assert_response :success
  end

end
