class DashboardController < ApplicationController

  def index

    redirect_to '/' unless current_user
  end
end
