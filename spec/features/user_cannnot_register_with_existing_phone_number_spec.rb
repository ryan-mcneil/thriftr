require 'rails_helper'

feature "As a visitor" do

  scenario "they cannot register with an existing phone number", :js do
    user = User.create(username: "ted", phone_number: "123")
    visit root_path

    expect(page).to have_content("Register here")
    click_on "Register here"

    expect(current_path).to eq(new_user_path)

    expect(page).to have_content("Sign up for Thriftr")

    fill_in 'user[username]', with: "Bob"
    fill_in 'user[phone_number]', with: '123'
    click_on "Create User"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Invalid information")
  end

end
