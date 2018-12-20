class ResultsController < ApplicationController
  def index
    @facade = LocationSearchFacade.new(params[:location])
  end

end
