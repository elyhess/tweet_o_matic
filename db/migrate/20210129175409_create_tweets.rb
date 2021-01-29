class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :twitter_account, foreign_key: true
      t.text :body
      t.datetime :publish_at
      t.string :tweet_id

      t.timestamps
    end
  end
end
