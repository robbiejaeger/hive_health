require 'rails_helper'

RSpec.feature "user can create a new site" do
  scenario "they go to a page with the new site" do
    user = create(:user)
    site = create(:site, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on site.name
    expect(page).to have_content("No hives at this site yet")

    click_on "Add a Hive to Your Site"

    fill_in "Name", with: "TestName"
    fill_in "Description", with: "This is just a test."

    click_on "Create Hive"

    expect(current_path).to eq(site_hive_path(Site.first, Hive.first))
    expect(page).to have_content("Created a new hive!")
    expect(page).to have_content("TestName")
    expect(page).to have_content("Logs for TestName")
    expect(page).to have_content("No logs for this hive yet")
  end
end
