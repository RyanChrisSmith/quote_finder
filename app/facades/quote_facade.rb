class QuoteFacade

  def self.search_term(input)
    json = QuoteService.search_by_input(input)
    total = json[:totalCount]
    quotes = json[:results].map do |quote_data|
      QuotePoro.new(quote_data)
    end
    [total, quotes]
  end

end

