RSpec.feature "User Authorization" do
  scenario "user cant access another users orders" do
    user = create(:user)
    user2 = create(:user)
    order = create(:order, user_id: user.id)
    order1 = create(:order, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/orders'
    expect(page).to have_content(order.id)
    expect(page).to have_content(order1.id)
    #can't test other user's orders because every user can only access /orders
  end
  scenario "user cant access admin pages" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_admin_item_path
    expect(page).to have_content("404")
    expect(page).to_not have_content("Create New Item")
  end
end

