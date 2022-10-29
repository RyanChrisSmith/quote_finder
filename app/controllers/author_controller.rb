class AuthorController < ApplicationController
  def index
    @author = AuthorFacade.one_author(params[:name])
  end
end
