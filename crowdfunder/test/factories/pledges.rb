FactoryGirl.define do
  factory :pledge do
    user #because it belongs to a user
    project #because it belongs to a project
    amount 5000
  end
end