FactoryBot.define do
  RANDOM_OVER_20_CHARS = "This must be more than 20 characters"
  factory :idea_factory do
    sequence(:title) { |n| Faker::Job.title + " #{n}" }
    description { Faker::Job.field + "-#{ RANDOM_OVER_20_CHARS }"}
    association(:user, factory: :user)
  end
end
