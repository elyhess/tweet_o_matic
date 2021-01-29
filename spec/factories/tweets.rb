FactoryBot.define do
  factory :tweet do
    user { nil }
    twitter_account { nil }
    body { "MyText" }
    publish_at { "2021-01-29 10:54:09" }
    tweet_id { "MyString" }
  end
end
