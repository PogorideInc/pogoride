# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    username "MyString"
    email "MyString"
    about_me "MyText"
    password_digest "MyString"
  end
end
