class UsersController < ApplicationController

  def login

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if params[:accept_cgu] != "on"
      flash[:notice] = "You must accept CGU to register."
    else
      @user.save
    end

    render :new
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
