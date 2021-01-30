class CreateAutomatedTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :automated_tweets do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :twitter_account, foreign_key: true
      t.string :body
      t.datetime :stop_at
      t.integer :post_interval

      t.timestamps
    end
  end
end
