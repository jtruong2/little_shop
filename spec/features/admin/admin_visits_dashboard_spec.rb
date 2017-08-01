require 'rails_helper'

RSpec.describe "Admin visits admin dashboard" do
  it "sees admin dashboard" do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_content("Admin Dashboard")
  end
end
