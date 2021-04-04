class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?
    return if tweet.publish_at > Time.current
    tweet.publish_to_twitter!
    ActionCable.server.broadcast "automated_tweets", { html: "<div>This should be appearing somewhere???</div>" }
  end

end
