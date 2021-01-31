class AutomatedTweetAddStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :automated_tweets, :status, :integer, default: 0
  end
end
