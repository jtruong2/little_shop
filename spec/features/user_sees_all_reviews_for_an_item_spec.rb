require 'rails_helper'

describe "User sees all reviews for items" do
  scenario "a user sees all the reviews for items if logged in" do
    user = create(:user)
    item = create(:item)
    review = item.reviews.create(user_id: user.id, body: "This was delicious!")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    visit item_path(item)

    expect(page).to have_content(item.title)
    expect(page).to have_content(review.body)
  end

  scenario "a user sees all the reviews for items if logged out" do
    user = create(:user)
    item = create(:item)
    review = item.reviews.create(user_id: user.id, body: "This was delicious!")

    visit item_path(item)

    expect(page).to have_content(item.title)
    expect(page).to have_content(review.body)
  end
end
