class User < ActiveRecord::Base
  has_many :panoramas

  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.uid = auth.uid
      user.provider = auth.provider
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.profile_image = auth.info.image
      create_users_panoramas(auth.uid)
    end
  end

  def create_users_panoramas(uid)
    service = PicasaService.new
    geo_albums = service.get_geo_album(uid)
    geo_albums.each { |geo_album| Panorama.new(geo_album) }
  end
end
