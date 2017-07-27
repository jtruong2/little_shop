require 'rails_helper'

RSpec.describe Cart do
  before (:each) do
    @items = create_list(:item, 3)
    @cart = Cart.new({"#{@items[0].id}" => 1, "#{@items[1].id}" => 2, "#{@items[2].id}" => 3})
  end
    describe "Instance Methods" do

      describe "#total_count" do
        it "calculates total number of items" do

          expect(@cart.total_count).to eq(6)
        end
      end

      describe "#add_item" do
        it "adds an item to the cart" do
          @cart.add_item(@items[0].id)
          @cart.add_item(@items[2].id)

          expect(@cart.contents).to eq({"#{@items[0].id}" => 2, "#{@items[1].id}" => 2, "#{@items[2].id}" => 4})
        end
      end

      describe "#count_of" do
        it "reports the number of a certain item" do
          expect(@cart.count_of(0)).to eq(0)
          expect(@cart.count_of("#{@items[1].id}")).to eq(2)
          expect(@cart.count_of("#{@items[2].id}")).to eq(3)
        end
      end

      describe "#items" do
        it "finds all items" do
          result = @cart.items

          expect(result.first.id).to eq(@items[0].id)
          expect(result.length).to eq(3)
        end
      end

      describe "#remove_item" do
        it "removes an item" do
          result = @cart.remove_item("#{@items[1].id}")

          expect(@cart.contents).to eq({"#{@items[0].id}" => 1, "#{@items[1].id}" => 1, "#{@items[2].id}" => 3})

          result_2 = @cart.remove_item("#{@items[2].id}")

          expect(@cart.contents).to eq({"#{@items[0].id}" => 1, "#{@items[1].id}" => 1, "#{@items[2].id}" => 2})
        end
      end

      describe "#total" do
        it "returns the total for the cart" do
          result = @cart.total

          expect(result).to eq(59.94)

          @cart.remove_item("#{@items[2].id}")
          result_2 = @cart.total

          expect(result_2).to eq(49.95)
        end
      end


  end
end
