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
  end
end
