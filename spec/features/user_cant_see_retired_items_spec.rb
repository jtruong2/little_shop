#As a user if I visit an item page and that item has been retired
#Then I should still be able to access the item page
#And I should not be able to add the item to their cart
#And I should see in place of the "Add to Cart" button or link - "Item Retired"

require 'rails_helper'

RSpec.describe "Retired Items" do
  it "A user can still access a retired items page but can't add item to cart" do
    user = create(:user)
    item = create(:item, status: "retired")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit item_path(item)

    expect(page).to have_content(item.title)
    expect(page).to_not have_content("Add to Cart")
    expect(page).to have_content("Item Retired")
  end
end
