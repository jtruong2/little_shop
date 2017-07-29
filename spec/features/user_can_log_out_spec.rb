require 'rails_helper'
RSpec.describe "User can log out" do
  scenario "logs user out" do
    # As a logged in user
    user = create(:user)
    visit login_path
    fill_in("session[email]", with: user.email)
    fill_in("session[password]", with: user.password)
    click_on "Log in"
    # When I click "Logout"
    visit items_path

    click_on "Logout"
    # Then I should see see "Login"
    expect(page).to have_content("Login")
    # And I should not see "Logout"
    expect(page).to_not have_content("Logout")
  end
end
