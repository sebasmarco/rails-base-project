# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    campaign_active false
    campaign_finish_at "2014-08-08 11:35:55"
    campaign_start_at "2014-08-08 11:35:55"
    country nil
  end
end
