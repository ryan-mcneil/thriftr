class RegisterController < ApplicationController

  def index
    if auth_hash
      token = auth_hash["credentials"]["token"]
      session[:token] = token
      @direction = :login
    else
      @direction = :register
    end
  end

  def create
    if params[:q] == session[:code]
      current_user.update(verified: true)
      session.clear
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
end
