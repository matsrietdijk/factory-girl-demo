FactoryGirl.define do
  # when your factory should be accessable under multiple names
  # you can give it aliases
  factory :user, aliases: [:author, :liker, :commenter] do
    # static values can/should be passed without a block
    name 'Username'
    email { "#{name.parameterize}+#{SecureRandom.uuid}@email.dummy" }
    password { SecureRandom.base64.first(16) }

    trait :with_posts do
      # using a callback the currently created object can be passed
      # to functions
      # default callbacks: before_create, after_create,
      #                    after_build & after_stub
      after(:build) do |user|
        user.posts = build_list(:post, 2, author: user)
      end
    end
  end
end
