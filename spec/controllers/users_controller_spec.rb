require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "Submit registration form" do
    context "when everything is good" do
      it "renders the page without error" do
        user = {
          email: "foo@bar.tld",
          username: "foo",
          password: "password",
          password_confirmation: "password",
        }

        post :create, params: { user: user, accept_cgu: "on" }

        expect(response).to redirect_to("/login")
      end
    end

    context "when username is too short or too long" do
      it "renders the page with an error message" do
        user = {
          email: "foo@bar.tld",
          username: "f",
          password: "password",
          password_confirmation: "password",
        }

        post :create, params: { user: user, accept_cgu: "on" }

        expect(response).to render_template(:new)
        expect(assigns(:user).errors.full_messages_for(:username)).to include("Username should contains between 3 and 20 characters")
      end
    end

    context "when username is empty" do
      it "renders the page with an error message" do
        user = {
          email: "foo@bar.tld",
          username: "",
          password: "password",
          password_confirmation: "password",
        }

        post :create, params: { user: user, accept_cgu: "on" }

        expect(response).to render_template(:new)
        expect(assigns(:user).errors.full_messages_for(:username)).to include("Username is required")
      end
    end

    context "when username is already registered" do
      it "renders the page with an error message" do
        user = {
          email: "foo@bar.tld",
          username: "foo",
          password: "password",
          password_confirmation: "password",
        }

        User.new(user).save

        post :create, params: { user: user, accept_cgu: "on" }

        expect(response).to render_template(:new)
        expect(assigns(:user).errors.full_messages_for(:username)).to include("Username already registered")
      end
    end

    context "when email is empty" do
      it "renders the page with an error message" do
        user = {
          email: "",
          username: "foo",
          password: "password",
          password_confirmation: "password",
        }

        post :create, params: { user: user, accept_cgu: "on" }

        expect(response).to render_template(:new)
        expect(assigns(:user).errors.full_messages_for(:email)).to include("Email is required")
      end
    end

    context "when email is already registered" do
      it "renders the page with an error message" do
        user = {
          email: "foo@bar.tld",
          username: "foo",
          password: "password",
          password_confirmation: "password",
        }

        User.new(user).save

        post :create, params: { user: user, accept_cgu: "on" }

        expect(response).to render_template(:new)
        expect(assigns(:user).errors.full_messages_for(:email)).to include("Email already registered")
      end
    end

    context "when email is not valid" do
      it "renders the page with an error message" do
        user = {
          email: "foo@bar",
          username: "foo",
          password: "password",
          password_confirmation: "password",
        }

        User.new(user).save

        post :create, params: { user: user, accept_cgu: "on" }

        expect(response).to render_template(:new)
        expect(assigns(:user).errors.full_messages_for(:email)).to include("Email invalid")
      end
    end

    context "when password is too short or too long" do
      it "renders the page with an error message" do
        user = {
          email: "foo@bar.tld",
          username: "foo",
          password: "bar",
          password_confirmation: "bar",
        }

        post :create, params: { user: user, accept_cgu: "on" }

        expect(response).to render_template(:new)
        expect(assigns(:user).errors.full_messages_for(:password)).to include("Password should contains between 8 and 50 characters")
      end
    end

    context "when CGU are not accepted" do
      it "renders the page with an error message" do
        user = {
          email: "foo@bar.tld",
          username: "foo",
          password: "bar",
          password_confirmation: "bar",
        }

        post :create, params: { user: user }

        expect(response).to render_template(:new)
        expect(flash[:notice]).to match(/^You must accept CGU to register.$/)
      end
    end

  end

end
