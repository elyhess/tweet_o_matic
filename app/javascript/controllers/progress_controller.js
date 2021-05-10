import { Controller } from "stimulus";
import consumer from "channels/consumer";

export default class extends Controller {
	static targets = ["status", "number", "barnumber"];

	connect() {
		this.subscription = consumer.subscriptions.create("AutomatedTweetsChannel", {
			connected: this._connected.bind(this),
			disconnected: this._disconnected.bind(this),
			received: this._received.bind(this),

		});
	}

	_connected() {}

	_disconnected() {}

	_received(data) {
		let tickIncrement = 100 / data.total_tweets // 20
		let currentPercentage = ((data.tweet_count / data.total_tweets) * 100);
		let progress = currentPercentage - tickIncrement;

		let bar = document.getElementById('bar');
		let progressInterval = setInterval(function() {
			progress += 1;
			bar.style.width = progress + "%";
			if (progress >= currentPercentage) {
				clearInterval(progressInterval);
			}
		}, 30)

		this.targets.find("number").innerHTML = data.tweet_count
		this.targets.find("barnumber").innerHTML = data.tweet_count

		if (data.tweet_count === data.total_tweets) {
			location.reload();
		}
	}
}