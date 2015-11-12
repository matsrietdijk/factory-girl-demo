FactoryGirl.define do
  factory :post do
    # the initial value can be passed to `sequence`
    # also; other attributes can be accessed when generating a value
    sequence(:title, 'a') { |c| "Factory generated post #{c}" }
    # create fake data with gems like `faker` to randomize factory results
    body { Faker::Lorem.paragraphs(5) }
    # instead of just calling `author` use `association` with the build strategy
    # to reduce generation time, this have a big impact on tests/specs speed
    association :author, strategy: :build

    # use traits for associations that are not required for a valid object
    trait :with_likers do
      # attributes in transient block will not be passed to the object
      # transient attributes can be accessed within the factory
      transient do
        number_of_likers 2
      end

      # use `build_list` so no database calls are made when not required
      likers { build_list(:liker, number_of_likers) }
    end

    trait :with_comments do
      # in old versions (< 4.5.0) of FactoryGirl the `ignore` block is used
      # instead of `transient`
      ignore do
        number_of_comments 2
        # transient attributes can have dynamic values
        commenter { build(:commenter) }
      end

      comments { build_list(:comment, number_of_comments, user: commenter) }
    end

    # nested factories inherit from parent
    # also traits can be assigned to reduce duplication
    factory :complete_post, traits: [:with_likers, :with_comments]
  end
end
