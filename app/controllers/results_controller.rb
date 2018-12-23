class ResultsController < ApplicationController
  def index
    render file: 'errors/not_found', status: 404 unless current_user
    @facade = LocationSearchFacade.new(params[:location])
  end

end
