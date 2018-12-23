require "rails_helper"

feature "as a visitor" do
  scenario "they can link to ynab site", :js do
  visit root_path

  ynab_link = "Don't have a YNAB (You Need A Budget) account?"

  expect(page).to have_link(ynab_link)
  click_on ynab_link
  end
end
