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
		let currentPercentage = ((data.tweet_count / data.total_tweets) * 100);

		this.targets.find("number").innerHTML = data.tweet_count
		this.targets.find("status").style.width = currentPercentage + "%"
		this.targets.find("barnumber").innerHTML = data.tweet_count

		if (data.tweet_count === data.total_tweets) {
			location.reload();
		}
	}
}