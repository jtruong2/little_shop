require 'rails_helper'
RSpec.describe do
  context "with valid account and previous order" do
    scenario "Users can view the previous order details" do
      # Then I should see each item that was order with the quantity and line-item subtotals
      user = create(:user)
      # order = create(:order, :with_items, item_count: 3, status: 3, user_id: user.id)
      # order1 = create(:order, :with_items, item_count: 3, status: 2, user_id: user.id)
#WE NEED TO CREATE THE ORDER THROUGH THE MODEL NOT FACTORY GIRL, AND WE NEED TO VISIT '/orders/:order_id'
      visit root_path
      click_on "Login"
      fill_in("session[email]", with: user.email)
      fill_in("session[password]", with: user.password)
      find('[name=commit]').click

      visit '/orders'

      first(".orderlinks").click_link("View Order from #{order.order_date}")
      expect(page).to have_content(order.subtotal)
      expect(page).to have_content(order.total)
      expect(page).to have_link(order.items.first.title)
      expect(page).to have_content(order.items.first.quantity)
      expect(page).to have_content("Completed")
      expect(page).to have_content(order.order_closed)
      expect(page).to have_content(order.order_date)

      visit "/users/#{user.id}/orders/#{order1.id}"

      expect(page).to have_content(order1.total)
      expect(page).to have_content("Cancelled")
      expect(page).to have_content(order1.order_closed)
    end

    scenario "It won't see when it was updated at if if it's status isn't completed/cancelled" do
      user = create(:user)
      order = create(:order, :with_items, item_count: 3, user_id: user.id)

      visit root_path
      click_on "Login"
      fill_in("session[email]", with: user.email)
      fill_in("session[password]", with: user.password)
      find('[name=commit]').click

      visit '/orders'

      first(".orderlinks").click_link("View Order from #{order.order_date}")
      expect(page).to have_content("Ordered")
      expect(page).to_not have_content("Completed/Cancelled at:")
      expect(page).to have_content(order.order_date)
    end
  end
end
