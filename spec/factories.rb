FactoryGirl.define do
  factory :project do
    name "MyString"
    source_code "MyText"
  end
  factory :user do
    sequence :email do |n|
      "user-#{n}@example.com"
    end
    password "Password123"
  end
end
