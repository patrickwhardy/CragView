class PicasaService
  def initialize
    @connection = Faraday.new(url: "https://picasaweb.google.com/data/feed/api/user/")
  end

  def get_albums(user_id)
    JSON.parse(@connection.get(user_id))
  end
end
