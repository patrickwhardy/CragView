require 'rails_helper'

RSpec.describe User, type: :model do
  xit "has oauth data and default role" do
    user = create(:user)
    #get this data from a omniauth request
    expect(user.provider).to eq()
    expect(user.uid).to eq()
    expect(user.name).to eq()
    expect(user.oauth_token).to eq()
    expect(user.oauth_expires_at).to eq()
    expect(user.profile_image).to eq()
    expect(user.role).to eq()
  end
end
