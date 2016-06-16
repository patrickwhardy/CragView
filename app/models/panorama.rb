class Panorama < ActiveRecord::Base
  belongs_to :user
  after_commit :clear_cache

  def clear_cache
    Rails.cache.clear
  end
end
