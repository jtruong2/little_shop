require 'rails_helper'
RSpec.describe "Logged in user visits /orders" do
  scenario "views past orders" do
    user = create(:user)
    order = create(:order, user_id: user.id)
    order1 = create(:order, user_id: user.id)

    visit root_path
    click_on "Login"
    fill_in("session[email]", with: user.email)
    fill_in("session[password]", with: user.password)
    find('[name=commit]').click
    click_on "View Orders"

    expect(page).to have_content(order.id)
    expect(page).to have_content(order1.id)
  end
end
