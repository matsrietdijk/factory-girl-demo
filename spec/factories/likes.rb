FactoryGirl.define do
  factory :like do
    association :post, strategy: :build
    association :user, strategy: :build
  end
end
