<!-- Shields -->
![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Ruby-2.5.3-orange)


![Tweet-O-Matic](https://github.com/elyhess/tweet_o_matic/blob/main/header.png)
<!-- TABLE OF CONTENTS -->
<summary><h2 style="display: inline-block">Table of Contents</h2></summary>
<ol>
  <li><a href="#about-the-project">About The Project</a>
  <li><a href="#project-board">Project Board</a></li>
  <li><a href="#database-schema">Database Schema</a></li>
  <li><a href="#built-with">Built With</a>
  <li><a href="#setup-instructions">Setup Instructions</a></li>
  <li><a href="#contact">Contact</a></li>
  <li><a href="#acknowledgements">Acknowledgements</a></li>
</ol>

<!-- ABOUT THE PROJECT -->
## About The Project

[Tweet-O-Matic](https://tweet-o-matic.herokuapp.com/) Is a twitter bot / Hootsuite clone application based off of the [GOrails](https://gorails.com/series/rails-for-beginners) tutorial series. As an extension, I added functionality using ActiveJob in conjunction with Redis & Sidekiq, allowing users to enable a tweet bot that will post tweets from their account at a set interval. This project is currently on-going and is meant as a play-ground for learning and implementing rails features.


<!-- PROJECT BOARD -->
## Project Board
Check out the [Project board](https://github.com/elyhess/tweet_o_matic/projects/1) for a complete list of features / user stories used to develop this application.

<!-- DATABBASE SCHEMA -->
## Database Schema

![Schema](https://github.com/elyhess/tweet_o_matic/blob/main/schema.png)

<!-- BUILT WITH -->
## Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [Postgresql](https://www.postgresql.org/)
* [Redis](https://redis.io/)
* [Sidekiq](https://sidekiq.org/)

<!-- SETUP INSTRUCTIONS -->
## Setup Instructions
To get a local copy up and running follow these simple steps.

1. Clone the repo
   ```
   git clone https://github.com/elyhess/tweet_o_matic
   ```
2. Install dependencies
   ```
   bundle install
   ```
3. DB creation/migration
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```
4. Run server and navigate to http://localhost:3000/
   ```
   rails s
   ```
OR

1. Visit heroku and sign in
   ```
   https://tweet-o-matic.herokuapp.com/
   ```

<!-- CONTACT -->
## Contact
* [Ely Hess](https://github.com/elyhess) - ely.hess@me.com


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [README template](https://github.com/othneildrew/Best-README-Template)
* [GOrails Tutorial](https://gorails.com/series/rails-for-beginners)
