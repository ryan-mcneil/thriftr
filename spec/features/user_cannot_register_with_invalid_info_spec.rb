require 'rails_helper'

feature "As a visitor" do

  scenario "they cannot register with an existing phone number", :js do
    user = User.create(username: "ted", phone_number: 1234567891)
    visit root_path

    expect(page).to have_content("Register here")
    click_on "Register here"

    expect(current_path).to eq(new_user_path)

    expect(page).to have_content("Sign up for Thriftr")

    fill_in 'user[username]', with: "Bob"
    fill_in 'user[phone_number]', with: 1234567891
    click_on "Create User"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Please complete all fields and enter a unique and valid phone number")
  end
  scenario "they cannot register without a 10-digit phone number", :js do
    visit root_path

    click_on "Register here"

    fill_in 'user[username]', with: "bmidler"
    fill_in 'user[phone_number]', with: 123
    click_on "Create User"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Please complete all fields and enter a unique and valid phone number")
  end
  scenario "they cannot register without alpha characters", :js do
    visit root_path

    click_on "Register here"

    fill_in 'user[username]', with: "bmidler"
    fill_in 'user[phone_number]', with: "12b3x3"
    click_on "Create User"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Please complete all fields and enter a unique and valid phone number")
  end

end
