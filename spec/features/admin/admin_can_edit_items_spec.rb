require 'rails_helper'
RSpec.describe "Admin Edits Items" do
  it "a Admin can edit an item" do
    item = create(:item, image: "https://www.elementstark.com/woocommerce-extension-demos/wp-content/uploads/sites/2/2016/12/pizza.jpg")
    category = create(:category)
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit '/menu'
    expect(page).to have_content(item.title)

    visit admin_items_path
    expect(page).to have_content(item.title)
    click_on "Edit"
    fill_in("item[title]", with: "Squid")
    fill_in("item[description]", with: "Perfect for Sailors")
    click_on "Update Item"

    expect(current_path).to eq(admin_items_path)
    expect(page).to have_content("Squid")

    visit '/menu'
    expect(page).to have_content("Squid")
  end
end
