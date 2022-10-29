require 'rails_helper'

RSpec.describe AuthorQuotesService do

  it 'will retrieve all quotes for one author', :vcr do
    quotes_returned = AuthorQuotesService.all_quotes_from_author("william c. menninger")
    quote = quotes_returned[:results][0]

    expect(quotes_returned).to be_a(Hash)
    expect(quote[:author].downcase).to eq("william c. menninger")
  end
end