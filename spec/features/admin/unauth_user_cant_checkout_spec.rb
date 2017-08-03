RSpec.feature "Unautorized User Authorization" do
  scenario "Unuthorized user cant access another users orders" do
    #Unable to test since all user orders go to /orders
  end
  scenario "Unauthorized user cant access admin pages" do

    visit new_admin_item_path
    expect(page).to have_content("The page you were looking for doesn't exist.")
    expect(page).to_not have_content("Create New Item")
  end
end

