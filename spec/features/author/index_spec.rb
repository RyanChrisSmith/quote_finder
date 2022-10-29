require 'rails_helper'

RSpec.describe 'author index' do
  it 'will have a link for the author', :vcr do
    quotes = QuoteFacade.search_term("love")
    quote = quotes[1].first
    author = AuthorFacade.one_author(quote.author)
    # As a visitor
    visit '/'
    fill_in :query, with: 'love'
    click_on 'Search for Quotes'
    # When I see my search results on '/quotes'
    # I see that each authors name is a link
    expect(page).to have_link(quote.author)
    # When I click on that link
    click_link(quote.author)
    # I'm taken to '/author'
    expect(current_path).to eq author_index_path
    # And I see that authors name, bio, and a link to their Wikipedia page
    expect(page).to have_content(author.name)
    # expect(page).to have_content(author.bio)
    expect(page).to have_content(author.link)
  end
end