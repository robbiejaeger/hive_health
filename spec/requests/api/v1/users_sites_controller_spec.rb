require 'rails_helper'

describe "User Sites Request" do
  describe "Get #index" do
    it "returns all sites for a single user" do
      user = create(:user)
      sites = create_list(:site, 3, user: user)

      get "/api/v1/users/#{user.id}/sites", headers: {'Authorization' => "Token token=#{user.api_key}"}

      expect(response.status).to eq(200)

      parsed_user = JSON.parse(response.body)

      expect(parsed_user.count).to eq(3)
    end
  end
end
