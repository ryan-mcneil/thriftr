class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to verify_path
  end


  private

  def user_params
    params.require(:user).permit(:username, :phone_number)
  end
end
