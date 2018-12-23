class DashboardController < ApplicationController

  def index
    render file: 'errors/not_found', status: 404 unless current_user
  end
end
