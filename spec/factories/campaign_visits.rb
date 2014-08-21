# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign_visit do
    referrer "MyString"
    user_agent "MyString"
    ip_address "MyString"
    campaign nil
  end
end
