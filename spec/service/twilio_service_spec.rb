require 'rails_helper'


RSpec.describe TwilioService do

  it 'it exists' do
    service = TwilioService.new

    expect(service).to be_a(TwilioService)
  end

  it '.formatted_number' do
    number = "123"
    service = TwilioService.new

    expect(service.formatted_number(number)).to eq("+1123")
  end

  it 'can send_verification_code' do
    VCR.use_cassette("twilio_verify_cassette") do
      number = "6182460553"
      code = "43819"
      service = TwilioService.new
      response = service.send_verification_code(number,code)

      expect(response.body).to eq("Sent from your Twilio trial account - #{code}")
    end
  end
end
