require 'rails_helper'

RSpec.feature "user follow and unfollow a site" do
  xscenario "they see the change from the button" do
    user1 = create(:user)
    user2 = create(:user)
    site1 = create(:site, user: user1)
    site2 = create(:site, user: user2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit site_path(site2.id)
    click_on "Follow This Site's Hives"

    visit site_path(site2.id)
    expect(page).to have_content("Unfollow This Site's Hives")
  end
end
