class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      twilio_verify
      redirect_to register_path
    else
      flash[:error] = "Please complete all fields and enter a unique and valid phone number"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :phone_number)
  end

end
