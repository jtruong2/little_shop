require 'rails_helper'
RSpec.describe do
  context "with valid credentials" do
    scenario "Visitor creates login" do
      # As a visitor
      user = build(:user)
      # When I visit "/"
      visit "/"
      # Then I should see a link for "Login"
      # And when I click "Login"
      click_on "Login"
      # And I should be on the "/login" page
      expect(current_path).to eq(login_path)
      # And I should see a link to "Create Account"
      # And when I click link "Create Account"
      click_on "Create Account"
      # And I fill in my desired credentials
      fill_in("user[email]", with: user.email)
      fill_in("user[password]", with: user.password)
      fill_in("user[address]", with: user.address)
      fill_in("user[city]", with: user.city)
      fill_in("user[state]", with: user.state)
      fill_in("user[zipcode]", with: user.zipcode)
      fill_in("user[phone]", with: user.phone)
      # And I submit my information
      click_on "Register"
      # Then my current page should be "/dashboard"
      expect(current_path).to eq("/dashboard")
      # And I should see a message in the navbar that says "Logged in as SOME_USER"
      expect(page).to have_content("Logged in as #{user.email}")
      # And I should see my profile information
      expect(page).to have_content("#{user.address}")
      # And I should not see a link for "Login"
      expect(page).to_not have_content("Login")
      # And I should see a link for "Logout"
      expect(page).to have_content("Logout")
    end
  end
end
