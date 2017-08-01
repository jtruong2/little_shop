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
end
