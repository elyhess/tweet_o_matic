window.addEventListener("load", loadExistingData);

var automationLink = document.getElementById('automation-link')
automationLink.addEventListener('click', loadExistingData)

totalTweetCount = parseInt(`<%= automated_tweet.total_tweets.to_i %>`);
percentageTick = parseInt(`<%= 100 / automated_tweet.total_tweets.ceil %>`)
tweetCount = parseInt(`<%= automated_tweet.tweet_count %>`)


function loadExistingData() {
    var storedPercentage = localStorage.getItem('percentage')
    getPercentage = JSON.parse(storedPercentage);
    currentPercentage = getPercentage;
    $('.progress-bar').css('width', currentPercentage + '%').attr('aria-valuenow', currentPercentage);

    var getValue = localStorage.getItem('value');
    var value = JSON.parse(getValue);
    if (!value) {
        value = -1
    }
    updateValues(value)
}

function addProgress() {
    currentPercentage = currentPercentage + percentageTick;

    var newPercentage = JSON.stringify(currentPercentage);

    localStorage.setItem("percentage", newPercentage)

    $('.progress-bar').css('width', currentPercentage + '%').attr('aria-valuenow', currentPercentage);
    updateValues()

    if (currentPercentage === 100) {
        window.location.reload();
        localStorage.clear();
    }
}

function updateValues(currentValue = 0) {
    var value = document.getElementsByClassName('progress-value');
    [...value].forEach((el) => {
        if (currentValue === 0) {
            var number = el.innerHTML;
            number++;
            localStorage.setItem("value", number);
            el.innerHTML = number;
        } else if (currentValue === -1) {
            el.innerHTML = 0
        } else {
            el.innerHTML = currentValue;
        }
    });
}
