require 'rails_helper'

RSpec.describe QuoteService do
  it 'will retrieve the quote API', :vcr do
    quotes = QuoteService.search_by_input("extreme love")

    expect(quotes).to be_a(Hash)
    expect(quotes[:results]).to be_an(Array)


    quotes[:results].each do |quote|
      expect(quote).to have_key(:author)
      expect(quote[:author]).to be_a(String)

      expect(quote).to have_key(:tags)
      expect(quote[:tags]).to be_an(Array)
    end
  end
end