require 'rails_helper'

RSpec.feature "user can create log for a hive" do
  scenario "they see the log on the hive show page" do
    user = create(:user)
    site = create(:site, user: user)
    hive = create(:hive, site: site)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit site_hive_path(site.id, hive.id)

    click_on "Submit a New Hive Log"

    fill_in "Notes", with: "This was a great day for the bees!"

    click_on "Submit Hive Log"

    expect(current_path).to eq(site_hive_path(site.id, hive.id))
    expect(page).to have_content("Created a new log!")
    expect(page).to have_content(hive.name)
    expect(page).to have_content("Logs for #{hive.name}")
    expect(page).to_not have_content("No logs for this hive yet")
  end
end
