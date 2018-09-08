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
      render :new
    else
      if @user.save
        redirect_to controller: "sessions", action: "new"
      else
        render :new
      end
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
