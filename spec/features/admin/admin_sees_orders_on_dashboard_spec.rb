require 'rails_helper'

RSpec.describe "Admin visits admin dashboard" do
  it "sees a listing of all orders" do
    admin = create(:user, role: 1)
    order1, order2 = create_list(:order, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_css("h2", "All Orders")
    expect(page).to have_content(order1.order_address)
    expect(page).to have_content(order1.order_city)
    expect(page).to have_content(order2.order_address)
    expect(page).to have_content(order2.order_phone)
  end

  it "sees the total number of orders for each status" do
    admin = create(:user, role: 1)
    orders = create_list(:order, 2)
    orders1 = create_list(:order, 2, status: 1)
    orders2 = create_list(:order, 2, status: 2)
    orders3 = create_list(:order, 2, status: 3)
# byebug
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
save_and_open_page
    expect(page).to have_content("Ordered: 2")
    expect(page).to have_content("Paid: 2")
    expect(page).to have_content("Cancelled: 2")
    expect(page).to have_content("Completed: 2")
  end
end
