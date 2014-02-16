# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ride do
    from "MyString"
    to "MyString"
    ride_date "2014-02-16 01:39:32"
    no_of_seats 1
    no_booked_seats 1
    description "MyText"
    donation_amt 1
    luggage_space false
    ski_rack false
    bike_rack false
    user_id 1
  end
end
