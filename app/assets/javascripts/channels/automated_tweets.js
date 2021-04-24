App.automated_tweets = App.cable.subscriptions.create("AutomatedTweetsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
   // ActionCable.server.broadcast "automated_tweets", { html: "<div>This should be appearing somewhere???</div>" } in console
   //
   //  $("#progress-bar").prepend(data.html);
   //  console.log("hey")
    addProgress()
  }
});
