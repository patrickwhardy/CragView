class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def destroy
    User.destroy(params["id"])
    redirect_to request.referrer
  end
end
