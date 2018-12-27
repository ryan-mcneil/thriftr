class VerificationController < ApplicationController

  def edit
    @direction = "/users/#{current_user.id}"
  end

  def update
    session[:new_phone_number] = params[:user][:phone_number]
    twilio_verify(params[:user][:phone_number])
    redirect_to edit_verification_path(current_user)
  end

end
