FactoryGirl.define do
  factory :like do
    transient do
      user_options nil
    end

    association :post, strategy: :build
    association :user, strategy: :build

    # transient attributes are passed to callbacks
    after(:build) do |like, trans|
      like.user.attributes = trans.user_options if trans.user_options
    end
  end
end
