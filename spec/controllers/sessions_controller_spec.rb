require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "Submit login form" do
    context "when credentials are correct" do
      it "should redirect to the root" do
        user = {
          email: "foo@bar.tld",
          username: "foo",
          password: "password",
          password_confirmation: "password",
        }
        
        User.new(user).save

        session = {
          username: "foo",
          password: "password",
        }

        post :create, params: { session: session }

        expect(response).to redirect_to root_url
      end
    end

    context "when credentials are not valid" do
      it "should render the login page with an error message" do
        user = {
          email: "foo@bar.tld",
          username: "foo",
          password: "password",
          password_confirmation: "password",
        }
        
        User.new(user).save

        session = {
          username: "foo",
          password: "bar",
        }

        post :create, params: { session: session }

        expect(response).to render_template(:new)
        expect(flash[:danger]).to eq("Invalid username/password combination")
      end
    end

  end

end
