FactoryGirl.define do
  factory :order do
    user nil
    subtotal 1
    total 1
    order_address "123 main st"
    order_city "denver"
    order_state "CO"
    order_zipcode "80202"
    order_phone "3102993847"
    status 0

    trait :with_items do
      transient do
        item_count 2
      end

      after(:create) do |order, evaluator|
        order.items << create_list(:item, evaluator.item_count)
      end
    end
  end
end
