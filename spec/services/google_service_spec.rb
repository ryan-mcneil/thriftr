require 'rails_helper'

describe GoogleService do
  subject { GoogleService.new }

  it 'exists' do
    expect(subject).to be_a GoogleService
  end

  context '#location_search' do
    it 'returns data from Google Places API' do
      stub_request(:get, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.742905,-104.989545&radius=500&key=#{ENV['GOOGLE_API_KEY']}").
      to_return(body: File.read("./spec/fixtures/nearby_search.json"))

      location_data = subject.location_search
      expect(location_data).to be_an Array
      expect(location_data[0]).to have_key :name
    end
  end
end
