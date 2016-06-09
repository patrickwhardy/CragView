class XMLParser
  def self.create_users_panoramas(uid)
    user = User.find_by(uid: uid)
    service = PicasaService.new
    panoramas = service.get_geo_album(uid)

    panoramas.each do |panorama_data|
      user.panoramas << Panorama.create(
      location: XMLParser.format_location(panorama_data["where"]["Point"]["pos"]),
      thumbnail: panorama_data["content"]["src"]
      )
    end
  end

  def self.format_location(location)
    location.gsub(/\s/, " " => ",")
  end
end
