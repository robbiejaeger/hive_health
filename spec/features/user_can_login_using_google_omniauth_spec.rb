require 'rails_helper'

describe "user can login with google" do
  it "can login and go to root path" do
    visit '/'
    expect(page).to have_content("Login")
    mock_omniauth
    click_link "Login"

    expect(page).to have_content("Hello, mockuser_first")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
    expect(current_path).to eq(root_path)
  end
end
