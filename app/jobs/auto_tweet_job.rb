class AutoTweetJob < ApplicationJob
	queue_as :default

	def perform(automated_tweet)
		automated_tweet.publish_to_twitter!
		ActionCable.server.broadcast "automated_tweets", { html: "<div>This should be appearing somewhere???</div>" }
		# ActionCable.server.broadcast "automated_tweets"
	end

end