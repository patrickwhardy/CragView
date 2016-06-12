class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:success] = "Signed in as #{user.name}!"
    redirect_to dashboard_path(user)
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully Signed Out"
    redirect_to root_path
  end
end
