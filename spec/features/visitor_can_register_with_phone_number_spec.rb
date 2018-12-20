require 'rails_helper'

feature "As a visitor" do

  scenario "they can register with their phone number" do
    visit root_path

    expect(page).to have_content("Register here")
    click_on "Register here"

    expect(current_path).to eq('/register')

    expect(page).to have_content("Sign up for Thriftr")

    fill_in 'user[username]', with: "Bob"
    fill_in 'user[phone_number]', with: '6182460553'
    click_on "Create User"

    fill_in :q, with: "12345"
    click_on "Verify"

    expect(current_path).to eq(dashboard_path)

  end

end
