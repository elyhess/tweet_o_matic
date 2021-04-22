class AutomatedTweet < ApplicationRecord
	belongs_to :user
	belongs_to :twitter_account

	validates_presence_of :body

	enum status: [:in_progress, :completed]

	after_create :timed_publish!

	def publish_to_twitter!
		twitter_account.client.update(tweet_content)
		self.increment(:tweet_count, 1).save
		change_status_to_completed
	end

	def change_status_to_completed
		if self.tweet_count == self.total_tweets
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
		tweet_count = 0
		self.total_tweets.times do
			AutoTweetJob.set(wait_until: tweet_count.minutes.from_now).perform_later(self)
			tweet_count += 1
		end
	end

end
