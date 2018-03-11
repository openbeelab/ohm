require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home page" do
    get root_path
    assert_response :success
  end

  test "should get cgu page" do
    get cgu_path
    assert_response :success
  end

  test "should get contact page" do
    get contact_path
    assert_response :success
  end

end
