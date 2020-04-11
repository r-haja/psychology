FactoryBot.define do
  factory :photo do
    post_image { "test.png" }
    association :post
  end
end
