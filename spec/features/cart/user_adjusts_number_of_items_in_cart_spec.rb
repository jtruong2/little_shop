'require rails_helper'

RSpec.describe do "user adjusts contents in cart" do
  it "a user can adjust the number of contents in cart" do
    As a visitor
    When I visit "/cart"
    Then I should see my item with a quantity of 1
    And when I increase the quantity
    Then my current page should be '/cart'
    And that item's quantity should reflect the increase
    And the subtotal for that item should increase
    And the total for the cart should match that increase

    item1 = create(:item)
    visit '/menu'
    click_on("Add Item")

    expect(page).to have_content("You now have 1 #{item1.title}.")
    expect(page).to have_content("Cart: 1")


  end
end
