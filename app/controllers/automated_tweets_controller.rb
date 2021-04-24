class AutomatedTweetsController < ApplicationController
	before_action :require_user_logged_in!

	def index
		@automated_tweets = Current.user.automated_tweets
	end

	def new
		@automated_tweet = AutomatedTweet.new
	end

	def create
		if Current.user.automated_tweets.any_in_progress?
			redirect_to automated_tweets_path, notice: "There is already a tweet automation in progress. Please wait for it to finish."
		else
			@automated_tweet = Current.user.automated_tweets.new(automated_tweet_params)
			if @automated_tweet.save
				redirect_to automated_tweets_path, notice: "Automated tweet has been started successfully"
			else
				flash[:alert] = "The date you select has already passed."
				redirect_to new_automated_tweet_path
			end
		end
	end

	def destroy
		@tweet = Current.user.automated_tweets.find(params[:id])
		@tweet.destroy
		redirect_to automated_tweets_path, notice: "Automated tweet was cancelled successfully"
	end

	def progress_bar
		automated_tweet = Current.user.automated_tweets.last
		render :json => automated_tweet
	end

	private

	def automated_tweet_params
		params.require(:automated_tweet).permit(:twitter_account_id, :body, :total_tweets)
	end
end