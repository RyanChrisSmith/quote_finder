require 'rails_helper'

RSpec.describe QuotePoro do
  it 'will return only the info needed', :vcr do
    quotes = QuoteService.search_by_input("extreme love")

    quote_data = quotes[:results].first

    quote = QuotePoro.new(quote_data)

    expect(quote).to be_a QuotePoro
    expect(quote.author).to be_a(String)
    expect(quote.content).to be_a(String)
    expect(quote.categories).to be_an(Array)

  end
end