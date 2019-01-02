class DashboardController < ApplicationController

  def index
    if params[:name] && params[:types]
      @facade = BudgetFacade.new({name: params[:name], types: params[:types]})
    end
    redirect_to '/' unless current_user
  end
end
