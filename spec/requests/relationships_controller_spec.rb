require 'rails_helper'

describe "RelationshipsRequest" do
  describe "Post #follow_site" do
    it "user follows a site" do
      user1 = create(:user)
      user2 = create(:user)
      site1 = create(:site, user: user1)
      site2 = create(:site, user: user2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      post "/#{site2.id}/follow_site"

      expect(response.status).to eq(302)
    end
  end

  describe "Post #unfollow_site" do
    it "user unfollows a site" do
      user1 = create(:user)
      user2 = create(:user)
      site1 = create(:site, user: user1)
      site2 = create(:site, user: user2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      post "/#{site2.id}/follow_site"
      post "/#{site2.id}/unfollow_site"

      expect(response.status).to eq(302)
    end
  end
end
