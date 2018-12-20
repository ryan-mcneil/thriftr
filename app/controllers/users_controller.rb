class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      twilio_verify
      redirect_to verify_path
    else
      flash[:error] = "phone number already in use"
      redirect_to register_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :phone_number)
  end

end
