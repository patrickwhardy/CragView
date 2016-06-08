require "rails_helper"
describe PicasaService do
  it "returns album data" do
    user_id = "109924137147373805722" #my uid returned from OAuth
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

    binding.pry
  end
end
