require 'rails_helper'

RSpec.feature "user can create a new site" do
  scenario "they go to a page with the new site" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Create a New Site"

    fill_in "Name", with: "TestName"
    fill_in "Description", with: "This is just a test."
    fill_in "Street", with: "1510 Blake Street"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip", with: "80202"

    click_on "Create Site"

    expect(current_path).to eq(site_path(Site.first))
    expect(page).to have_content("TestName")
    expect(page).to have_content("About TestName:")
    expect(page).to have_content("Set Site Status as Healthy")
  end
end
