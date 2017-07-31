require 'rails_helper'
RSpec.describe "Visitor adds items to cart" do
  scenario "creates an account and checks out as logged in user" do
    user = create(:user)
    item = create(:item)

    visit items_path
    first(:button, "Add Item").click
    click_on "Cart: 1"

    expect(page).to have_content(item.title)

    click_on "Create Account"
    fill_in("user[email]", with: user.email)
    fill_in("user[password]", with: user.password)
    fill_in("user[address]", with: user.address)
    fill_in("user[city]", with: user.city)
    fill_in("user[state]", with: user.state)
    fill_in("user[zipcode]", with: user.zipcode)
    fill_in("user[phone]", with: user.phone)
    click_on "Register"
    click_on "Cart: 1"

    expect(page).to have_content(item.title)
  end
end
