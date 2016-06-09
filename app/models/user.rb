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
    end
  end
end
