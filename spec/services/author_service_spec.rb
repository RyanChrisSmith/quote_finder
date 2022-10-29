require 'rails_helper'

RSpec.describe AuthorService do 
  it 'can retrieve one author by name', :vcr do
    author_results = AuthorService.find_author("William C. Menninger")
    
    expect(author_results).to be_a(Hash)
    expect(author_results[:results]).to be_an(Array)
    
    author = author_results[:results][0]

    expect(author).to have_key(:name)
    expect(author[:name]).to be_a(String)
    
    expect(author).to have_key(:bio)
    expect(author[:bio]).to be_a(String)
    
    expect(author).to have_key(:link)
    expect(author[:link]).to be_a(String)
  end
end
