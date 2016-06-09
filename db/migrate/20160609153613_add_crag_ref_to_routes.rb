class AddCragRefToRoutes < ActiveRecord::Migration
  def change
    add_reference :routes, :crag, index: true, foreign_key: true
  end
end
