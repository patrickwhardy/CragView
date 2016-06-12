class CragsController < ApplicationController
  def index
    @crags = Crag.all
  end

  def new
    @crag = Crag.new
    @location = params["location"]
  end

  def create
    @crag = Crag.new(crag_params)
    if @crag.save
      flash[:notice] = "Successfully added #{@crag.name} to our database!"
      redirect_to crags_path(@crag)
    else
      flash[:error] = @crag.errors.full_messages.join(", ")
      redirect_to request.referrer
    end
  end

  def show
    @crag = Crag.find(params["id"])
  end

  def destroy
    Crag.destroy(params["id"])
    redirect_to request.referrer
  end

  def update
    @crag = Crag.find(params["crag"]["id"])
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
