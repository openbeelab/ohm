require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "foo", email: "foo@bar.tld", password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "username should be more than 3 characters long" do
    @user.username = "a" * 2
    assert_not @user.valid?
  end

  test "username should be less than 20 characters long" do
    @user.username = "a" * 2
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = ""
    @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password should be more than 8 characters long" do
    @user.password = "a" * 7
    assert_not @user.valid?
  end

  test "password should be less than 50 characters long" do
    @user.password = "a" * 51
    assert_not @user.valid?
  end

  test "password should be confirmed" do
    @user.password = "foobar_password"
    @user.password_confirmation = "foobar_foobar"
    assert_not @user.valid?
  end

end
