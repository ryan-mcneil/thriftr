require 'rails_helper'

describe 'a user' do
  it 'can search nearby for current location' do
    stub_request(:get, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.7491066,-104.9969853&radius=200&key=#{ENV['GOOGLE_API_KEY']}").
              to_return(body: File.read("./spec/fixtures/nearby_search.json"))

    # As a registered user
    # When I visit /dashboard
    visit '/dashboard'
    # Then I see a button that says “Search Current Location”
    # And when I click on the button “Search Current Location”
    click_on 'Search Current Location'
    # I am redirected to /results
    expect(current_path).to eq(results_path)
    # Under a section called Select Your Current Location”
    expect(page).to have_content("Select Your Current Location")
    # I see a list of links with Location Names within 100 meters of my current location
    within '.locations' do
      expect(page).to have_css(".location", count: 10)
      expect(page).to have_link("The Cheesecake Factory")
    end
  end

end
