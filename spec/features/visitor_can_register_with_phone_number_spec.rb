require 'rails_helper'

feature "As a visitor" do
  scenario "cannot login with phone number that doesn't exist in the db", :js do
    visit root_path

    expect(page).to have_button("Login")

    fill_in :q, with: 6182460553
    click_on "Login"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("We don't have that number in our system, please try again")
  end
  scenario "cannot register with incorrect verification code", :js do
    VCR.use_cassette("user_registers_with_phone_number_cassette") do
      visit root_path

      expect(page).to have_content("Register here")
      click_on "Register here"

      expect(current_path).to eq(new_user_path)

      expect(page).to have_content("Sign up for Thriftr")

      fill_in 'user[username]', with: "Bob"
      fill_in 'user[phone_number]', with: 6182460553
      click_on "Submit"

      fill_in :q, with: "19035"
      click_on "Verify"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Verification code was incorrect. Please re-enter information")
    end
  end
  scenario "can get to phone code page after oauth", :js do
    VCR.use_cassette("user_registers_with_phone_number_cassette") do
      stub_omniauth
      user = User.create(username: "godzilla", phone_number: 3038853559)

      visit root_path

      expect(page).to have_button("Login")

      fill_in :q, with: 3038853559
      click_on "Login"

      expect(current_path).to eq("/auth/ynab/callback")
    end
  end
  scenario "cannot login with incorrect verification code", :js do
    VCR.use_cassette("user_registers_with_phone_number_cassette") do
      stub_omniauth
      user = User.create(username: "godzilla", phone_number: 3038853559)

      visit root_path

      fill_in :q, with: 3038853559
      click_on "Login"

      fill_in :q, with: "19035"
      click_on "Verify"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Verification code was incorrect. Please login again")
    end
  end
  scenario "does not get text message with verification code", :js do
    VCR.use_cassette("user_registers_with_phone_number_cassette") do
      stub_omniauth
      user = User.create(username: "godzilla", phone_number: 3038853559)

      visit root_path

      fill_in :q, with: 3038853559
      click_on "Login"

      expect(current_path).to eq("/auth/ynab/callback")
      expect(page).to have_content("If you do not receive a text, please click the button above to retry")
    end
  end
end
