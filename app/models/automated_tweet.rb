class AutomatedTweet < ApplicationRecord
	belongs_to :user
	belongs_to :twitter_account

	validates_presence_of :body
	validates :stop_at, presence: true
  validates :stop_at, inclusion: { in: (Time.current..Time.current+5.years) }

	enum status: [:in_progress, :completed]

	after_create :timed_publish!

	after_initialize do
		self.stop_at ||= 24.hours.from_now
	end

	def publish_to_twitter!
		twitter_account.client.update(tweet_content)
		self.increment(:tweet_count, 1).save
		change_status_to_completed
	end

	def total_tweets
		((self.stop_at - self.created_at) / 60)
	end

	def change_status_to_completed
		if self.tweet_count == total_tweets.round
			self.update(status: 1)
		end
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
		# Change time publish to use an amount of hours run instead of a start and stop time.
		# user inputs 24 hours, it runs for 24 hours. (or minutes)
		tweet_count = 0
		total_hours = ((self.stop_at - self.created_at) / 60).round(0)
		total_hours.times do
			AutoTweetJob.set(wait_until: tweet_count.minutes.from_now).perform_later(self)
			tweet_count += 1
		end
	end

end
