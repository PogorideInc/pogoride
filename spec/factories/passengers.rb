# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passenger do
    association :rides
    ride_id 1
    passenger_id 1
  end
end
