require 'rails_helper'
RSpec.describe "User logs in" do
  context "with valid credentials" do
    scenario "logs into users account" do
      user = create(:user)

      visit root_path
      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in("session[email]", with: user.email)
      fill_in("session[password]", with: "password")
      click_on "Log in"

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Logged in as #{user.email}")
      expect(page).to have_content("#{user.address}")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end

  context "with invalid credentials" do

  end


end
