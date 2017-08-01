require 'rails_helper'
RSpec.describe "User logs in" do
  context "with valid credentials" do
    scenario "can edit their account" do
      user = create(:user)

      visit root_path
      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in("session[email]", with: user.email)
      fill_in("session[password]", with: "password")
      find('[name=commit]').click

      expect(current_path).to eq("/dashboard")

      click_on("Edit")
      visit edit_user_path(user)

      expect(current_path).to eq("/users/#{user.id}/edit")

      new_email = "Thisisfake@fakemail.com"

      fill_in("user[email]", with: new_email)
      fill_in("user[password]", with: user.password)
      fill_in("user[address]", with: user.address)
      fill_in("user[city]", with: user.city)
      fill_in("user[state]", with: user.state)
      fill_in("user[zipcode]", with: user.zipcode)
      fill_in("user[phone]", with: user.phone)
      click_on "Edit"

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content(new_email)
    end
  end
end
