class Panorama < ActiveRecord::Base
  belongs_to :user
  belongs_to :crag
end
