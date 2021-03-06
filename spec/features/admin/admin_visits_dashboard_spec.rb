require 'rails_helper'

RSpec.describe "Admin dashboard" do
  it "admin sees admin dashboard" do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_content("Admin Dashboard")
  end

  it "admin is directed to admin dashboard at login" do
    admin = create(:user, role: 1)

    visit '/'

    click_on 'Login'

    fill_in "session[email]", with: admin.email
    fill_in "session[password]", with: admin.password
    find('[name=commit]').click

    expect(current_path).to eq('/admin/dashboard')
  end

  it "users sees 404 page" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  it "visitor sees 404 page" do

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

end
