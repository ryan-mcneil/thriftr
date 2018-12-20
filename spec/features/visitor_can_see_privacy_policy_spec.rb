require 'rails_helper'

feature "As a visitor" do
  scenario "visit privacy policy" do
    visit root_path
    click_link "Privacy Policy"

    expect(current_path).to eq(privacy_path)
    expect(page).to have_content("Privacy Policy")
  end
end
