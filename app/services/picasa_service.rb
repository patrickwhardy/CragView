class PicasaService
  def initialize
    @connection = Faraday.new(url: "https://picasaweb.google.com/data/feed/api/user/")
  end

  def get_albums(user_id)
    Hash.from_xml(@connection.get(user_id).body)
  end

  def geo_album_id(user_id)
    albums = get_albums(user_id)["feed"]["entry"]
    if albums
      geo_entry = albums.find do |entry|
        entry["title"] == "Geo Panoramas" if entry.class == Hash
      end
      geo_entry["id"][0].split("/").last if geo_entry
    end
  end

  def get_album_data(user_id, album_id)
    response = Hash.from_xml(@connection.get("#{user_id}/albumid/#{album_id}").body)
    response["feed"]["entry"]
  end

  def get_geo_album(user_id)
    album_id = geo_album_id(user_id)
    get_album_data(user_id, album_id) if album_id
  end
end
