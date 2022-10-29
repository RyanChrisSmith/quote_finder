class AuthorPoro 
  attr_reader :name, :bio, :link

  def initialize(author_data)
    @name = author_data[:name]
    @bio = author_data[:bio]
    @link = author_data[:link]
  end
end
