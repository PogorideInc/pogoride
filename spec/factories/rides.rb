# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ride do
    #association :user
    from "Vancouver"
    to "Seattle"
    #ride_date "2014-02-16 01:39:32"
    ride_date (Date.today) + 1
    no_of_seats 3
    no_booked_seats 1
    description "I need someone that doesnt yak"
    donation_amt 30
    luggage_space true
    ski_rack false
    bike_rack false
    user_id 1
  end
end
