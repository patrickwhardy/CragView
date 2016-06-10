class Admin::CragsController < Admin::BaseController
  def index
    @crags = Crag.all
  end
end
