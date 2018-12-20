class VerifyController < ApplicationController

  def index

  end

  def create
    if params[:q] == session[:code]
      current_user.update(verified: true)
      redirect_to root_path
    else
      User.find(session[:user_id]).delete
      flash[:error] = "Verification code was incorrect. Please re-enter information"
      redirect_to register_path
    end
  end

end
