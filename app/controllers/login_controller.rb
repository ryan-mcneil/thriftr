class LoginController < ApplicationController

 def new

   if user = User.find_by(phone_number: params[:q])
     session[:user_id] = user.id
     twilio_verify
   else
     flash[:error] = "Try again!"
     redirect_to root_path
   end
 end
end
