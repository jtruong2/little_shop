require 'rails_helper'
RSpec.describe "Admin Cannot Edit" do
  it "a Admin cannot edit other user page" do
    user = create(:user)
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "users/#{user.id}"
    
    expect(page).to have_content("You don't have access to that page!")
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Edit", user_path(user))
  end
end
