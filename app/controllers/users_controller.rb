class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def destroy
    User.destroy(params["id"])
    redirect_to request.referrer
  end
end
