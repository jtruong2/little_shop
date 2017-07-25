FactoryGirl.define do
  factory :item do
    sequence :name do |i|
     "item#{i}"
    end
    price "9.99"
    category
  end
end
