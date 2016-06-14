class Admin::CragsController < Admin::BaseController
  def index
    @crags = Crag.all
  end

  def edit
    @crag = Crag.find(params["id"])
  end
end
