class Api::V1::CragsController < ApplicationController
  respond_to :json

  def create
    binding.pry
    respond_with :api, :v1, Crag.create(crag_params)
  end

  private

  def crag_params
    params.require(:crag).permit(:name, :description, :directions, :location)
  end
end
