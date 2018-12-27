class VerificationController < ApplicationController

  def edit
    twilio_verify(params[:phone_number])
  end

  def update

  end

end
