require "rails_helper"

RSpec.describe XMLParser do
  it "formats PicasaService return" do
    user = create(:user)

    XMLParser.create_users_panoramas(user.uid)

    panorama = user.panoramas.first

    expect(user.panoramas.count).to eq(5)
    expect(panorama.location).to eq("39.7319304,-105.0271554")
    expect(panorama.thumbnail).to eq("https://lh3.googleusercontent.com/-3OLUYCnhvYk/V1IGvaXfBmI/AAAAAAAAAGg/VDXpfOXvHwsXdgByCYmVpiF_eqreLLlvwCHM/2016-06-03.jpg")
  end

  it "handles users without panospheres" do
    user = create(:user)
    user.uid = "103740002480338461663"

    XMLParser.create_users_panoramas(user.uid)

    expect(user.panoramas.count).to eq(0)
  end
end
