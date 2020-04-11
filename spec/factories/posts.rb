FactoryBot.define do
  factory :post do
    title { "test" }
    discription { "test_disc" }
    association  :user 
  end
end
