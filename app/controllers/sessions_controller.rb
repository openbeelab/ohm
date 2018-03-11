class SessionsController < ApplicationController
  layout 'users'

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:danger] = "Invalid username/password combination"
      render :new
    end
  end

  def destroy
  end

end
