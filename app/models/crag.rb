class Crag < ActiveRecord::Base
  validates_presence_of :location, :name, :description, :directions
  after_commit :clear_cache

  def clear_cache
    Rails.cache.clear
  end
end
