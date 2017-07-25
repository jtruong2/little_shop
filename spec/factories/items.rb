FactoryGirl.define do
  factory :item do
    sequence :name do |i|
      "name#{i}"
    end
    category
    price "5.00"
  end
end
