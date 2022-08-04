FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Funny Movie #{n}" }
    sequence(:description) { |n| "This is a description of Funny Movie #{n}" }
    sequence(:link) { |n| "https://www.youtube.com/watch?v=fycv54mPLhw#{n}" }
  end
end
