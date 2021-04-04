class AutomatedTweetsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "automated_tweets"
  end

  def unsubscribed
    stop_all_streams
  end
end
