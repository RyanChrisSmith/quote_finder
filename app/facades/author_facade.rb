class AuthorFacade
  def self.one_author(author)
    author_data = AuthorService.find_author(author)

    author = AuthorPoro.new(author_data[:results][0])
  end
end