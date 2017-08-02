require 'rails_helper'
RSpec.describe do
  context "with valid account" do
    scenario "Users can place a new order" do
      user = create(:user)
      item1, item2 = create_list(:item, 2)
      visit '/menu'
      click_on "Add Item", :match => :first
      visit '/cart'

      click_link "Login or Register to Checkout"

      expect(current_path).to eq('/login')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/cart'
      expect(page).to have_link("Checkout")

      click_link "Checkout", :exact => true

      expect(current_path).to eq('/orders')
      expect(page).to have_content("Order was successfully placed")
      expect(page).to have_content("Order ID")
    end
  end
end
