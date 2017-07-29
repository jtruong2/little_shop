require 'rails_helper'
RSpec.describe do
  context "with valid account and previous order" do
    scenario "Users can view the previous order details" do
      # Then I should see each item that was order with the quantity and line-item subtotals
      # And I should see the current status of the order **(ordered, paid, cancelled, completed)**
      # And I should see the date/time that the order was submitted
      #
      # If the order was completed or cancelled
      # Then I should see a timestamp when the action took place
      user = create(:user)
      order = create(:order, :with_items, item_count: 3, user_id: user.id)
      order1 = create(:order, :with_items, item_count: 3, user_id: user.id)

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
      expect(page).to have_content(order.order_date)
    end
  end
end
