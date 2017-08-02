require 'rails_helper'

RSpec.describe "Admin visits orders status page" do
  it "sees cancel button for paid or ordered statuses" do
    admin = create(:user, role: 1)
    orders = create_list(:order, 2)
    orders1 = create_list(:order, 2, status: 1)
    orders2 = create_list(:order, 2, status: 2)
    orders3 = create_list(:order, 2, status: 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "Ordered"

    click_on "View Order from", :match => :first

    expect(page).to have_content(orders[0].id)
    expect(page).to have_content(orders[0].order_phone)
    expect(page).to have_button("Cancel")
  end
end
