class Author::QuotesController < ApplicationController
  def index
    @quotes = AuthorQuotesFacade.all_quotes_author(params[:name])
  end
end
