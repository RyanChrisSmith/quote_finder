class QuotesController < ApplicationController
  def index
    @total, @quotes = QuoteFacade.search_term(params[:query])
  end
end
