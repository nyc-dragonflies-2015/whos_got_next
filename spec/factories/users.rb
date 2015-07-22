FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    username Faker::Internet.user_name
    password Faker::Internet.password(6)
    email Faker::Internet.safe_email
    phone_number Faker::PhoneNumber.phone_number
  end
end