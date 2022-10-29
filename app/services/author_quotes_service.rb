class AuthorQuotesService 

  def self.all_quotes_from_author(author)
    response = conn.get("/search/quotes?query=\"#{author}\"&fields=author")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.quotable.io") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end