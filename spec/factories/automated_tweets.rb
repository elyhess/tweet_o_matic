FactoryBot.define do
  factory :automated_tweet do
    user { nil }
    twitter_account { nil }
    body { "MyString" }
    stop_at { "2021-01-30 10:45:08" }
    post_interval { 1 }
  end
end
