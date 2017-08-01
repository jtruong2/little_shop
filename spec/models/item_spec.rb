require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:description) }
  end

  it "should have a default image" do
  category = create(:category)
  item = Item.create(title: "Test", description: "MMM", price: 10.00, category_id: category.id)

  expect(item.image).to eq('pizza_planet_logo.jpg')
  end
  describe "associations" do
    it { is_expected.to belong_to(:category) }
  end
end
