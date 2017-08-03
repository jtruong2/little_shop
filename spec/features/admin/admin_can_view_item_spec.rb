require 'rails_helper'
RSpec.describe "Admin can view Items" do
  it "can view all items" do
    admin = create(:user, role: 1)
    item1 = create(:item)
    item2 = create(:item, status: "retired")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
    click_on "items index"
    expect(current_path).to eq(admin_items_path)

    visit admin_items_path

    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
    expect(page).to have_content("Active")
    expect(page).to have_link("Item Page")
    expect(page).to have_link("Edit")
    expect(page).to have_content(item2.title)
    expect(page).to have_content(item2.description)
    expect(page).to have_content('Retired')
  end
end
