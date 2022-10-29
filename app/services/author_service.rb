class AuthorService
  def self.conn
    Faraday.new(url: "https://api.quotable.io") do |f|
      f.adapter Faraday.default_adapter
    end
  end


  def self.find_author(name)
    response = conn.get("/search/authors?query=#{name}")
    JSON.parse(response.body, symbolize_names: true)
  end
end