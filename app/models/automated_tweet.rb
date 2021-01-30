class AutomatedTweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates_presence_of :body
  validates :stop_at, presence: true
  validates_inclusion_of :post_interval, :in => 1..10
end
