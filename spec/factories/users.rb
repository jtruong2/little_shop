FactoryGirl.define do
  factory :user do
    sequence :email do |i|
      "email#{i}"
    end
    password "password"
    address "123 fake st"
    city "Denver"
    state "CO"
    zipcode "80239"
    phone "123456789"
    #role
  end
end
