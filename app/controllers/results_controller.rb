class ResultsController < ApplicationController
  def index
    @facade = LocationSearchFacade.new
  end

end
