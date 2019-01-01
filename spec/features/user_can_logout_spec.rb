require "rails_helper"

describe "user" do
  it "they can log out from Thriftr", :js do
    user = User.create(username: "godzilla", phone_number: 3038853559)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path

    click_on "Log Out"

    expect(current_path).to eq(root_path)
  end
end
