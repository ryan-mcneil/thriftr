class RegisterController < ApplicationController

  def index
    if auth_hash
      token = auth_hash["credentials"]["token"]
      session[:token] = token
      unless current_user.ynab_budget_id
        budget_id = get_id(token)
        current_user.update(ynab_budget_id: budget_id)
      end
      @direction = :login
    else
      @direction = :register
    end
  end

  def create
    if params[:q] == session[:code]
      current_user.update(verified: true)
      session.clear
      flash[:error] = "Please login to complete the registration process"
      redirect_to root_path
    else
      User.find(session[:user_id]).delete
      session.clear
      flash[:error] = "Verification code was incorrect. Please re-enter information"
      redirect_to new_user_path
    end
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end

  def get_id(token)
    conn = Faraday.new(url: 'https://api.youneedabudget.com')

    response = conn.get "/v1/budgets" do |f|
      f.headers['Authorization'] = "Bearer #{token}"
    end

    budget_data = JSON.parse(response.body, symbolize_names: true)
    budget_data[:data][:budgets][0][:id]
  end
end
