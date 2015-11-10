FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    association :post, strategy: :build
    association :user, strategy: :build
  end
end
