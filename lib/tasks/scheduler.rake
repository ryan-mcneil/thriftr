task :send_text => :environment do
  User.daily_notification_users.each do |user|
    msg = Message.random 
    TwilioService.new.send_notification(user.phone_number, msg)
  end
end
