require "rails_helper"

feature "as a visitor" do
  scenario "I cannot acccess certain pages", :js do
    visit dashboard_path
    expect(page).to have_content("The page you're looking for could not be found")

    visit preferences_path
    expect(page).to have_content("The page you're looking for could not be found")

    visit results_path
    expect(page).to have_content("The page you're looking for could not be found")
  end
end
