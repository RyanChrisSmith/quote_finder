require 'rails_helper'

RSpec.describe 'author quotes index' do
  it 'has a link to display all quotes from the specific artist', :vcr do
    quotes = QuoteFacade.search_term("love")
    quote = quotes[1].first
    author = AuthorFacade.one_author(quote.author)
    all_quotes = AuthorQuotesFacade.all_quotes_author(author.name)
    # As a visitor
    visit '/'
    fill_in :query, with: 'love'
    click_on 'Search for Quotes'
    # When I see my search results on '/quotes'
    # And click on an author's name
    click_on(author.name)
    # I'm taken to '/author'
    # And I can now see a link to see all of that Author's quotes
    expect(page).to have_link('See all quotes')
    # When I click that link
    click_on('See all quotes')
    # I'm taken to '/author/quotes'
    expect(current_path).to eq(author_quotes_path)
    # Where I can see the Author's name, and all of their quotes listed
    expect(page).to have_content(author.name)

    all_quotes.each do |each_quote|
      expect(page).to have_content(each_quote.content)
    end
  end
end