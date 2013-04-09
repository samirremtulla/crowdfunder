# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Karl"
    last_name "Denninger"
    sequence(:email) {|n| "karl#{n}@example.com" } #because we have uniqueness on email test
    password "karl.is.king"
  end
end
