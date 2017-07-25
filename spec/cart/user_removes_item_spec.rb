require 'rails_helper'

RSpec.describe "As a guest" do
  scenario "removes an item from their cart" do
    item = create(:item)
    guest = create(:user, role: 0)

    visit '/cart'

    click_on "Remove", :match => :first

    expect(current_path).to eq('/cart')
    expect(page).to have_content("Successfully removed #{item.name} from your cart."
    expect(page).to have_link("#{item.name}")
    expect(page).to_not have_content(item.description)
  end
end
