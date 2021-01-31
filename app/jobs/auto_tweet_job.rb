class AutoTweetJob < ApplicationJob
	queue_as :default

	def perform(automated_tweet)
		automated_tweet.publish_to_twitter!
	end

end