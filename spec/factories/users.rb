require 'faker'

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Name.name }
    email { Faker::Internet.email }
    about_me { | n | "#{n}: This is me." }
    password "password"
    password_confirmation "password"

    factory :invalid_user do
    	username nil
    end
  end
end
