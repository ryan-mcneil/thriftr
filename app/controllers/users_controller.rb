class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      code = random_code
      TwilioService.new.send_verification_code(user.phone_number,code)
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

  def random_code
    rand(10000..99999).to_s
  end
end
