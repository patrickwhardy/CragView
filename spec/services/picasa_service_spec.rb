require "rails_helper"
describe PicasaService do
  it "returns album data" do
    user_id = "109924137147373805722" #uid for patrickwhardy returned from OAuth
    service = PicasaService.new
    album_data = service.get_albums(user_id)

    expect(album_data.class).to eq(Hash)
    expect(album_data["feed"].class).to eq(Hash)
  end

  it "returns Geo album id" do
    user_id = "109924137147373805722"
    service = PicasaService.new

    expect(service.geo_album_id(user_id)).to eq("6292099039613053713")
  end

  it "returns Geo Panorama Album data" do
    user_id = "109924137147373805722"
    service = PicasaService.new

    album_id = service.geo_album_id(user_id)
    album_data = service.get_album_data(user_id, album_id)

    expect(album_data.class).to eq(Array)
    expect(album_data.first.class).to eq(Hash)
    expect(album_data.first["where"]).to eq({"Point"=>{"pos"=>"39.7319304 -105.0271554"}})
    expect(album_data.first["content"]["src"]).to eq("https://lh3.googleusercontent.com/-3OLUYCnhvYk/V1IGvaXfBmI/AAAAAAAAAGg/VDXpfOXvHwsXdgByCYmVpiF_eqreLLlvwCHM/2016-06-03.jpg")
  end
end
