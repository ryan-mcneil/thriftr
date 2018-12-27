class TwilioService

  def initialize
  end

  def send_verification_code(user_number,code)
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @client.messages.create(to: formatted_number(user_number) ,from: "+16183900798", body: code)
  end

  def send_notification(user_number,msg)
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @client.messages.create(to: formatted_number(user_number) ,from: "+16183900798", body: msg.text_msg)
  end

  def formatted_number(number)
    "+1#{number}"
  end

end
