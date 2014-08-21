# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
    name "MyString"
    email "MyString"
    pledge_type nil
  end
end
