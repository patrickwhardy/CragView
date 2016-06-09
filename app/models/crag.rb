class Crag < ActiveRecord::Base
  has_many :routes
  has_many :panoramas
end
