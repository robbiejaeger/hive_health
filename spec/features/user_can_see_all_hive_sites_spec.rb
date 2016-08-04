require 'rails_helper'

RSpec.feature "user can see all sites" do
  scenario "they go to a page with a map of the sites" do
    visit root_path

    click_on "Hive Sites Map"

    expect(current_path).to eq(sites_path)
    expect(page).to have_css("div#all-sites-map")
  end
end
