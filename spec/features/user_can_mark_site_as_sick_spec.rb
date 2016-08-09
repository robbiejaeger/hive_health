require 'rails_helper'

RSpec.feature "user can mark a site as sick" do
  scenario "they see the change from the button" do
    user = create(:user)
    site = create(:site, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit site_path(site.id)

    click_on "Set Site Status as Sick"

    expect(page).to have_content("Site information changed.")
    expect(page).to have_content("Set Site Status as Healthy")
    expect(page).to_not have_content("Set Site Status as Sick")
  end
end
