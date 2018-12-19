require 'rails_helper'

describe LocationSearchFacade do

  let :subject { LocationSearchFacade.new }

  it 'exists' do
    expect(subject).to be_a LocationSearchFacade
  end

  context 'instance methods' do
    context '#locations' do
      it 'returns a collection of Location Objects' do
        stub_request(:get, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.742905,-104.989545&radius=500&key=#{ENV['GOOGLE_API_KEY']}").
          to_return(body: File.read("./spec/fixtures/nearby_search.json"))

        expect(subject.locations.count).to eq 6
        expect(subject.locations.first).to be_a Location
      end
    end
  end
end
