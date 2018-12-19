require 'rails_helper'

feature "As a visitor" do

  scenario "they can register with their phone number" do
    visit root_path

    expect(page).to have_content("Register here")
    click_on "Register here"

    expect(current_path).to eq('/register')


  end

end
