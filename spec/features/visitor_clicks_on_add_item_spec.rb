require 'rails_helper'
RSpec.describe "Visitor clicks on add item" do
  scenario "adds item to cart" do
    item = create(:item)

    visit items_path
    click_on "Add item"
  end
end
