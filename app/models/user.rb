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
    update_panoramas(auth[:uid])
    return User.find_by(uid: auth[:uid])
  end

  def self.update_panoramas(uid)
    user = User.find_by(uid: uid)
    # untested - add condition to find unsaved panos
    XMLParser.create_users_panoramas(uid) if user.panoramas == []
  end

  def admin?
    self.role == 1
  end
end
