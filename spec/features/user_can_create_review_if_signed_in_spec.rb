require 'rails_helper'

describe "User sees creates review for item" do
  scenario "a user creates reviews for item if logged in" do
    user = create(:user)
    item = create(:item)
    review = item.reviews.new
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit item_path(item)

    fill_in("review[body]", with: "Yummy!")
    click_on "Submit"

    expect(page).to have_content(item.title)
    expect(page).to have_content("Yummy!")
  end

  scenario "a user cannot creates reviews for item if not logged in" do
    user = create(:user)
    item = create(:item)
    review = item.reviews.new

    visit item_path(item)

    fill_in("review[body]", with: "Yummy!")
    click_on "Submit"

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content("Yummy")

    fill_in("session[email]", with: user.email)
    fill_in("session[password]", with: "password")
    find('[name=commit]').click

    visit item_path(item)

    fill_in("review[body]", with: "Yummy!")
    click_on "Submit"

    expect(page).to have_content(item.title)
    expect(page).to have_content("Yummy!")
  end
end
