# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    association :ride
    from_user 1
    to_user 1
    ride_id 1
    message_text "Hello world!"
  end
end
