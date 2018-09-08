require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get register page" do
    get register_path
    assert_response :success
  end

  describe "Submit registration form" do
    context "when everything is good" do
      it "renders the page without error" do
        user = create(:user)

        post :create, user: {
          email: user.email,
          username: user.username,
          password: user.password,
          password_confirmation: user.password,
          accept_cgu: "on",
        }

        expect(response).to render_template(:new)
      end
    end
  end
end
