FactoryGirl.define do
  factory :user do
    sequence :username do |i|
      "name#{i}"
    end
    sequence :email do |i|
      "email#{i}"
    end
    password "password"
    address "123 fake st"
    city "Denver"
    state "CO"
    zipcode "80239"
    phone_number "123456789"
  end
end
