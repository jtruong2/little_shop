require 'rails_helper'
RSpec.describe do
  context "with valid credentials" do
    scenario "Visitor creates login" do
      user = build(:user)
      visit "/"
      click_on "Login"

      expect(current_path).to eq(login_path)
      
      click_on "Create Account"
      fill_in("user[email]", with: user.email)
      fill_in("user[password]", with: user.password)
      fill_in("user[address]", with: user.address)
      fill_in("user[city]", with: user.city)
      fill_in("user[state]", with: user.state)
      fill_in("user[zipcode]", with: user.zipcode)
      fill_in("user[phone]", with: user.phone)
      click_on "Register"

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Logged in as #{user.email}")
      expect(page).to have_content("#{user.address}")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end
end
