class AutomatedTweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates_presence_of :body
  validates :stop_at, presence: true
  validates_inclusion_of :post_interval, :in => 1..10

  enum status: [:in_progress, :completed]

  after_initialize do
    self.stop_at ||= 24.hours.from_now
  end

  after_create :timed_publish!

  def publish_to_twitter!
    automated_tweet = twitter_account.client.update(tweet_content)
  end

  def self.any_in_progress?
    in_progress = where(status: 0).count
    in_progress > 0
  end

  def tweet_content
    if body == "famous last words"
      Faker::Quote.famous_last_words
    elsif body == "most interesting man in the world"
      Faker::Quote.most_interesting_man_in_the_world
    else
      Faker::Quote.yoda
    end
  end

  def timed_publish!
    counter = 0
    total_hours = ((self.stop_at - self.created_at) / 60 / 60).round(0)
    total_hours.times do
      AutoTweetJob.set(wait_until: counter.hours.from_now).perform_later(self)
      counter += 1
      return if  counter == total_hours
      self.status = 1
    end
  end

end
