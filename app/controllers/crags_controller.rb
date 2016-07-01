class CragsController < ApplicationController
  def index
    if params["search"]
      @crags = Crag.where('lower(name) = ?', params["search"].downcase)
    else
      @crags = Crag.all
    end
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

  private

  def crag_params
    params.require(:crag).permit(:name, :description, :directions, :location)
  end
end
