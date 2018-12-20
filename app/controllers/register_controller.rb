class RegisterController < ApplicationController

  def index

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

end
