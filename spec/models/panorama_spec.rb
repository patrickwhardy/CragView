require 'rails_helper'

RSpec.describe Panorama, type: :model do
  it "has a location, thumbnail and user" do
    panorama = create(:panorama)

    expect(panorama.location).to eq("40.0132937,-105.3091995")
    expect(panorama.thumbnail).to eq("https://lh3.googleusercontent.com/-2kARWJyko4Y/V1eTMt4mFEI/AAAAAAAAAJ4/2WgkmkjrnEgFOIW4M8vBUPe_rhhrjU9bACHM/2016-06-07.jpg")
    expect(panorama.user).to eq(User.last)
  end
end
