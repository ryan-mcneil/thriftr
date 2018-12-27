require "rails_helper"

feature "as a visitor" do
  scenario "I cannot acccess certain pages", :js do
    visit dashboard_path
    expect(current_path).to eq(root_path)

    visit preferences_path
    expect(current_path).to eq(root_path)

    visit results_path
    expect(current_path).to eq(root_path)
  end
end
