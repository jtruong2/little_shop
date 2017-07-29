require 'rails_helper'
RSpec.describe "User can log out" do
  scenario "logs user out" do
    user = create(:user)
    visit login_path
    fill_in("session[email]", with: user.email)
    fill_in("session[password]", with: user.password)
    find('[name=commit]').click

    visit items_path

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end
