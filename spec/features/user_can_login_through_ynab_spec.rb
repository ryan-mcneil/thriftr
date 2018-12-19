require 'rails_helper'

feature "As a visitor" do
  scenario "visit login and use YNAB OAuth" do

    visit root_path

    expect(page).to have_button("Log in with YNAB")

    click_on "Log in with YNAB"

    expect(current_path).to eq(phone_path)

  end

  xscenario "phone number" do

    visit phone_path

    fill_in :phone_number, with: 6182460553
    click_on "Submit"

    expect(current_path).to eq(phone_path)
    # I receive a text message with a 6-digit code
    # And enter the 6-digit code into the empty code field and click “Submit”
    fill_in :phone_code, with: 123456
    click_on "Submit"

    expect(current_path).to eq(dashboard_path)
  end
end
