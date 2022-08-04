FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "tai.le#{n}@local.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
