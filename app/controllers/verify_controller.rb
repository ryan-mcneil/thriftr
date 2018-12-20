class VerifyController < ApplicationController

  def index

  end

  def create
    if params[:q] == session[:code]
      current_user.update(verified: true)
      redirect_to root_path
    else
      flash[:error] = "Incorrect, we are sending you a new code"
      twilio_verify
      redirect_to verify_path
    end
  end

end
