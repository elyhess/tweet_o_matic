# frozen_string_literal: true

class TwitterAccountComponent < ViewComponent::Base
	attr_reader :twitter_account

	def initialize(twitter_account:)
		@twitter_account = twitter_account
	end
end
