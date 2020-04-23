FactoryBot.define do
  factory :passport do
    purpose { "test_purpose" }
    goal { "test_goal" }
    genre_id { 2 }
    association :user
    association :genre
  end
end
