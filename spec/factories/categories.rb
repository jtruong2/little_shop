FactoryGirl.define do
  factory :category do
    sequence :name do |i|
      "category#{i}"
    end
  end
end
