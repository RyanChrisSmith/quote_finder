class AuthorQuotesFacade 
  def self.all_quotes_author(author)
    json = AuthorQuotesService.all_quotes_from_author(author)

    quotes = json[:results].map do |quote|
      QuotePoro.new(quote)
    end
  end
end