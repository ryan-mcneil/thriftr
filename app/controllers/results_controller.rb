class ResultsController < ApplicationController
  def index
    redirect_to '/' unless current_user
    @facade = LocationSearchFacade.new(params[:location])
  end

end
