class PicasaService
  def initialize
    @connection = Faraday.new(url: "https://picasaweb.google.com/data/feed/api/user/")
  end

  def get_albums(user_id)
    Hash.from_xml(@connection.get(user_id).body)
  end

  def geo_album_id(user_id)
    geo_entry = get_albums(user_id)["feed"]["entry"].find do |entry|
      entry["title"] == "Geo Panoramas"
    end
    geo_entry["id"][0].split("/").last
  end

  def get_album_data(user_id, album_id)
    response = Hash.from_xml(@connection.get("#{user_id}/albumid/#{album_id}").body)
    response["feed"]["entry"]
  end
end
