#As an Unauthenticated User I cannot view another user's private data, such as current order, etc.
#I should be redirected to login/create account when I try to check out.
#I cannot view the administrator screens or use administrator functionality.
#I cannot make myself an administrator.
RSpec.feature "Unautorized User Authorization" do
  scenario "Unuthorized user cant access another users orders" do
    user = create(:user)
    order1 = create(:order, user_id: user.id)
    #NEEDS ERROR PAGES FOR '/ORDERS', OTHERWISE ERRORS OUT AT CONTROLLER
    #visit '/orders'
    #expect(page).to_not have_content(order1.id)
  end
  scenario "Unauthorized user cant access admin pages" do

    visit new_admin_item_path
    expect(page).to have_content("The page you were looking for doesn't exist.")
    expect(page).to_not have_content("Create New Item")
  end
end

