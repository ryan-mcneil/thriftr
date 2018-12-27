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
      flash[:error] = "Invalid information"
      redirect_to new_user_path
    end
  end

  def edit

  end

  def update
    binding.pry 
  end

  private

  def user_params
    params.require(:user).permit(:username, :phone_number)
  end

end
