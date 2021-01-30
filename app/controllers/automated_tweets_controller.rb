class AutomatedTweetsController < ApplicationController
	before_action :require_user_logged_in!

	def index
		@automated_tweets = Current.user.automated_tweets
	end
	
	def new
		@collection = ["famous last words", "most interesting man in the world", "yoda"]
		@automated_tweet = AutomatedTweet.new
	end

	def create
		@automated_tweet = Current.user.automated_tweets.new(automated_tweet_params)
		if @automated_tweet.save
			redirect_to automated_tweets_path, notice: "Automated tweet has been started successfully"
		else
			render :new
		end
	end

	def destroy
		@tweet = Current.user.automated_tweets.find(params[:id])
		@tweet.destroy
		redirect_to automated_tweets_path, notice: "Automated tweet was cancelled successfully"
	end


	private

	def automated_tweet_params
		params.require(:automated_tweet).permit(:twitter_account_id, :body, :stop_at, :post_interval)
	end
end