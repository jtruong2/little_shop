require 'rails_helper'

RSpec.describe "As a guest" do
  scenario "is able to add an item to the cart" do
    item = create(:item)

    visit items_path

    click_on "Add Item"

    click_on "Cart: 1"

    expect(page).to have_selector("img")
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_content("Cart Total: $#{item.price}")
  end
end
