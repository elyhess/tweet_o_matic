fetchAutoTweet()
async function fetchAutoTweet() {
    let response = await fetch('/progress_bar');
    let data = await response.json();

    let percentage = (data.tweet_count / data.total_tweets) *  100
    let tweetCount = data.tweet_count


    localStorage.setItem("percentage", JSON.stringify(percentage));
    localStorage.setItem("value", JSON.stringify(tweetCount));
}

function restoreAllValues () {
    localStorage.setItem("percentage", JSON.stringify(0));
    localStorage.setItem("value", JSON.stringify(0));
}
if (document.getElementById("clear-lS") != null) {
    document.getElementById("clear-lS").addEventListener("click", restoreAllValues);
}


window.addEventListener("load", loadExistingData);

window.onLoad=function() {
    var automationLink = document.getElementById('automation-link')
    automationLink.addEventListener('click', loadExistingData)
}

function loadExistingData() {
    var storedPercentage = localStorage.getItem('percentage')
    getPercentage = JSON.parse(storedPercentage);
    currentPercentage = getPercentage;
    $('.progress-bar').css('width', currentPercentage + '%').attr('aria-valuenow', currentPercentage);

    var getValue = localStorage.getItem('value');
    var value = JSON.parse(getValue);
    if (value === null) {
        updateValues(0)
    } else {
        updateValues(value)
    }
}

function addProgress() {
    currentPercentage = currentPercentage + percentageTick;

    var newPercentage = JSON.stringify(currentPercentage);

    localStorage.setItem("percentage", newPercentage)

    $('.progress-bar').css('width', currentPercentage + '%').attr('aria-valuenow', currentPercentage);

    if (window.location.pathname === "/automated_tweets") {
        updateValues()
    } else {
        var getValue = localStorage.getItem('value');
        var value = JSON.parse(getValue);
        offPageUpdate(value)
    }

    if (currentPercentage === 100) {
        localStorage.clear();
        window.location.reload();
    }
}

function updateValues(currentValue) {
    var value = document.getElementsByClassName('progress-value');
    [...value].forEach((el) => {
        if (currentValue === 0 || currentValue) {
            el.innerHTML = currentValue
        } else {
            var number = el.innerHTML
            number++;
            localStorage.setItem("value", JSON.stringify(number));
            el.innerHTML = number;
        }
    });
}


function offPageUpdate(currentValue) {
    var newValue = currentValue + 1;
    console.log(newValue)
    localStorage.setItem("value", JSON.stringify(newValue));
}