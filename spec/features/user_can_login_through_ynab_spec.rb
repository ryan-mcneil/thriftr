require 'rails_helper'

feature "As a visitor" do
  xscenario "can login with phone number", :js do

    visit root_path

    expect(page).to have_button("Login")

    fill_in :q, with: 6182460553
    click_on "Login"

    expect(current_path).to eq(login_path)

  end
  scenario "cannot login with phone number that doesn't exist in the db", :js do

    visit root_path

    expect(page).to have_button("Login")

    fill_in :q, with: 6182460553
    click_on "Login"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Try again!")
  end
  xscenario "user can login with phone number and oauth", :js do
    user = User.create(username: "godzilla", phone_number: "3038853559")

    visit root_path

    fill_in :q, with: 3038853559
    click_on "Login"

    expect(current_path).to eq(login_path)
  end
end
