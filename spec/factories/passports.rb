FactoryBot.define do
  factory :passport do
    purpose { "test_purpose" }
    goal { "test_goal" }
    association :user
  end
end
