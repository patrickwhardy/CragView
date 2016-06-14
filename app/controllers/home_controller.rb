class HomeController < ApplicationController
  def show
    @crags = Crag.all
  end
end
