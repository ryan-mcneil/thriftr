class ResultsController < ApplicationController
  def index
    @facade = SearchFacade.new
  end

end
