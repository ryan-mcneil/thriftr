require 'spec_helper'
require './app/models/location'

describe Location do
  let :attrs {
    {
      name: "The Cheesecake Factory",
      types: ["restaurant"]
    }
  }
  subject { Location.new(attrs)}

  it 'exists' do
    expect(subject).to be_a Location
    expect(subject.name).to eq "The Cheesecake Factory"
    expect(subject.types.first).to eq "restaurant"
  end
end
