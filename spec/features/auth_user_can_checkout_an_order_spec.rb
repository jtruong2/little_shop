require 'rails_helper'
RSpec.describe do
  context "with valid account" do
    scenario "Users can place a new order" do
      user = create(:user)
      item1, item2 = create_list(:item, 2)
      visit '/menu'
      click_on "Add Item", :match => :first
      # As a visitor
      # When I add items to my cart
      # And I visit "/cart"
      visit '/cart'

      # And I click "Login or Register to Checkout"
      click_link "Login or Register to Checkout"

      # Then I should be required to login
      expect(current_path).to eq('/login')
      #
      # When I am logged in
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # fill_in("session[email]", with: user.email)
      # fill_in("session[password]", with: user.password)
      # find('[name=commit]').click

      # And I visit my cart
      visit '/cart'
      expect(page).to have_link("Checkout")
      # And when I click "Checkout"
      click_link "Checkout", :exact => true
      # Then the order should be placed

      # And my current page should be "/orders"
      expect(current_path).to eq('/orders')
      expect(page).to have_content("Order was successfully placed")
      # And I should see a message "Order was successfully placed"
      expect(page).to have_content("Order ID")
      # And I should see the order I just placed in a table
    end
  end
end
