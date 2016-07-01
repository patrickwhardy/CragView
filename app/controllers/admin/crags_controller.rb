class Admin::CragsController < Admin::BaseController
  def index
    @crags = Crag.all
  end

  def edit
    @crag = Crag.find(params["id"])
  end

  def destroy
    Crag.destroy(params["id"])
    redirect_to request.referrer
  end

  def update
    @crag = Crag.find(params["id"])
    @crag.update(crag_params)
    if @crag.save
      redirect_to admin_crags_path(current_user)
    else
      flash[:error] = @crag.errors.full_messages.join(", ")
    end
  end

  private

  def crag_params
    params.require(:crag).permit(:name, :description, :directions, :location)
  end
end
