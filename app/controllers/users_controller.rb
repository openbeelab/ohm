class UsersController < ApplicationController

  def login

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      flash[:notice] = "OK"
      flash[:color] = "valid"
    else
      flash[:notice] = "KO"
      flash[:color] = "invalid"
    end

    render :new
  end


  private

  def allowed_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
