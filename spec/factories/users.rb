FactoryGirl.define do
  # when your factory should be accessable under multiple names
  # you can give it aliases
  factory :user, aliases: [:author, :liker, :commenter] do
    # static values can be passed without a block
    name 'Username'
    # use `sequence` when data should be unique
    # also; other attributes can be accessed when generating a value
    sequence(:email) { |n| "#{name.downcase}+#{n}@email.dummy" }
    password { SecureRandom.base64.first(16) }

    trait :with_posts do
      # using a callback the currently created object can be passed
      # to functions
      # default callbacks: after_create, after_build,
      #                    before_create & before_build
      after(:build) do |user|
        user.posts = build_list(:post, 2, author: user)
      end
    end
  end
end
