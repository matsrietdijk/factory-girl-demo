FactoryGirl.define do
  factory :user, aliases: [:author, :liker, :commenter] do
    # static values can be passed without a block
    name 'Username'
    # use `sequence` when data should be unique
    # other attributes can be accessed when generating a value
    sequence(:email) { |n| "#{name.downcase}+#{n}@email.dummy" }
    password { SecureRandom.base64.first(16) }
  end
end
