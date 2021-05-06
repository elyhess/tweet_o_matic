# frozen_string_literal: true

class AutomatedTweetComponent < ViewComponent::Base

	attr_reader :automated_tweet

	def initialize(automated_tweet:)
		@automated_tweet = automated_tweet
	end

end
