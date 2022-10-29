require 'rails_helper'

RSpec.describe 'Landing Page' do
  it "can fill in form with a keyword, hit submit and redirect to quotes index", :vcr do
    visit root_path

    fill_in :keyword, with: 'I am'

    click_on "Search for Quotes"

    expect(current_path).to eq("/quotes")
  end
end
