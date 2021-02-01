class AddTweetcountToAutomatedTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :automated_tweets, :tweet_count, :integer, default: 0
  end
end
