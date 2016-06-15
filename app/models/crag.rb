class Crag < ActiveRecord::Base
  validates_presence_of :location, :name, :description, :directions
end
