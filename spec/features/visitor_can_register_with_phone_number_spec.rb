require 'rails_helper'

feature "As a visitor" do


  scenario "they cannot register with incorrect verification code", :js do
    VCR.use_cassette("user_registers_with_phone_number_cassette") do
      visit root_path

      expect(page).to have_content("Register here")
      click_on "Register here"

      expect(current_path).to eq(new_user_path)

      expect(page).to have_content("Sign up for Thriftr")

      fill_in 'user[username]', with: "Bob"
      fill_in 'user[phone_number]', with: '6182460553'
      click_on "Create User"

      fill_in :q, with: "19035"
      click_on "Verify"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Verification code was incorrect. Please re-enter information")
    end

  end

end
