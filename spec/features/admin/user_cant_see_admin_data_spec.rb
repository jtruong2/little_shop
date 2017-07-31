#As an Authenticated User I cannot view another user's private data (current or past orders, etc)
#I cannot view the administrator screens or use admin functionality
#I cannot make myself an admin
require 'rails_helper'
RSpec.feature "User Authorization" do
  scenario "user cant access another users orders" do
    user = create(:user)
    user2 = create(:user)
    order = create(:order, user_id: user.id)
    order1 = create(:order, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_orders_path(user)
    expect(page).to have_content(order.id)
    expect(page).to have_content(order1.id)

    visit '/users/2/orders'
    expect(page).to have_content(order.id)
    expect(page).to have_content(order1.id)

    visit '/users/100000/orders'
    expect(page).to have_content(order.id)
    expect(page).to have_content(order1.id)
  end
  scenario "user cant access admin pages" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_admin_item_path
    expect(page).to have_content("404")
    expect(page).to_not have_content("Create New Item")
  end
end

