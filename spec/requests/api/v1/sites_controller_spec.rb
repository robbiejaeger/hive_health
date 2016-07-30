require 'rails_helper'

describe "Sites Request" do
  describe "Get #index" do
    it "returns all sites for all users" do
      user = create(:user)
      sites = create_list(:site, 3, user: user)

      get "/api/v1/sites"

      expect(response.status).to eq(200)

      parsed_sites = JSON.parse(response.body)

      expect(parsed_sites.count).to eq(3)
    end
  end
end
