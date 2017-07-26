FactoryGirl.define do
  factory :item do
    sequence :title do |i|
     "item#{i}"
    end
    price "9.99"
    image "image.com"
    description "finger-licking good"
    category
  end
end
