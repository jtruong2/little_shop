require 'rails_helper'
RSpec.describe "Admin Creates Items" do
  it "a Admin can create item" do
    item = create(:item)
    category = create(:category)
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit '/menu'
    expect(page).to have_content(item.title)

    visit new_admin_item_path
    expect(page).to have_content("Create a New Item")

    fill_in("item[title]", with: "Squid")
    fill_in("item[image]", with: "https://www.elementstark.com/woocommerce-extension-demos/wp-content/uploads/sites/2/2016/12/pizza.jpg")
    fill_in("item[description]", with: "For Navy Seadogs")
    fill_in("item[price]", with: 10.00)
    select category.name, :from => "item[category_id]"
    click_on "Create Item"

    visit '/menu'
    expect(page).to have_content(item.title)
    expect(page).to have_content("Squid")
  end
end
