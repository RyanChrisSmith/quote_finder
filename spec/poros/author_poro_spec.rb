require 'rails_helper'

RSpec.describe AuthorPoro do 
  it 'can make an AuthorPoro object from the AuthorService info provided' do
    author_data = {:_id=>"PyQOMX6cxaNs",
      :name=>"William C. Menninger",
      :link=>"https://en.wikipedia.org/wiki/William_C._Menninger",
      :bio=>
      "William Claire Menninger  (October 15, 1899 – September 6, 1966)  was a co-founder with his brother Karl and his father of The Menninger Foundation in Topeka, Kansas, an internationally known center for treatment of behavioral disorders.",
      :description=>"Karl Menninger's brother",
      :quoteCount=>3,
      :slug=>"william-c-menninger",
      :dateAdded=>"2021-04-23",
      :dateModified=>"2021-04-23"}

    author = AuthorPoro.new(author_data)

    expect(author.name).to eq("William C. Menninger")
    expect(author.link).to eq("https://en.wikipedia.org/wiki/William_C._Menninger")
    expect(author.bio).to include("The Menninger Foundation")
  end
end