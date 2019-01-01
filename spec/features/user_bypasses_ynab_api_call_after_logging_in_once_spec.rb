require "rails_helper"

describe "a user" do
  it "does have a budget_api call for first login", :js do
    stub_twilio_api
    stub_omniauth
    stub_ynab_budget_id_request

    user = User.create(username: "godzilla", phone_number: 3038853559)

    visit root_path

    fill_in :q, with: 3038853559
    click_on "Login"
  end
  it "does LoginController have a budget_api call after the first login", :js do
    stub_twilio_api
    stub_omniauth
    
    user = User.create(username: "godzilla", phone_number: 3038853559, ynab_budget_id: "#{ENV['YNAB_BUDGET_ID']}")

    visit root_path

    fill_in :q, with: 3038853559
    click_on "Login"
  end
end
