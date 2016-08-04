require 'rails_helper'

RSpec.feature "user can login using google oauth" do
  scenario "user can login  and logout with google" do
    visit root_path
    expect(page).to have_content("Login")
    mock_omniauth

    click_on "Login"

    expect(page).to have_content("Hello, mockuser_first")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
    expect(current_path).to eq(dashboard_path)

    click_on "Logout"

    expect(page).to_not have_content("Logout")
    expect(page).to have_content("Login")
  end
end
