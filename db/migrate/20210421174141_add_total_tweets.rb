class AddTotalTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :automated_tweets, :total_tweets, :integer, default: 0
    remove_column :automated_tweets, :post_interval, :integer
    remove_column :automated_tweets, :stop_at, :datetime
  end
end
