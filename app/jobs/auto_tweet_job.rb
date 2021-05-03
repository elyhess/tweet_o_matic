class AutoTweetJob < ApplicationJob
	queue_as :default
	sidekiq_options retry: false

	include ActiveSupport::Rescuable
	rescue_from ActiveRecord::RecordNotFound, with: :tweet_failure

	def perform(automated_tweet)
		if automated_tweet.present?
			automated_tweet.publish_to_twitter!
			ActionCable.server.broadcast "automated_tweets", { tweet_count: automated_tweet.tweet_count, total_tweets: automated_tweet.total_tweets }
		end
	end

	def tweet_failure
		print "Something went wrong..."
	end

end