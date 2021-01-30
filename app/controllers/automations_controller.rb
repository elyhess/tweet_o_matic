class AutomationsController < ApplicationController
	before_action :require_user_logged_in!

	def index
		@collection = { famous_last_words:                 Faker::Quote.famous_last_words,
		                most_interesting_man_in_the_world: Faker::Quote.most_interesting_man_in_the_world,
		                yoda:                              Faker::Quote.yoda }
	end

end