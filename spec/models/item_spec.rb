require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end
  describe "associations" do
    it { is_expected.to belong_to(:category) }
  end
end
