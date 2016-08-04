require 'rails_helper'

RSpec.feature "user can see dashboard" do
  scenario "they see the map" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Your HiveHealth Dashboard")
    expect(page).to have_content("Map of Your Hive Sites")
    expect(page).to have_content("Your Hive Sites")
    expect(page).to have_content("Logs of Sites You Are Following")

    expect(current_path).to eq(dashboard_path)
  end
end
