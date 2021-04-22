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

[Tweet-O-Matic](https://tweet-o-matic.herokuapp.com/) Is a twitter bot application inspired by Buffer and HootSuite. After signing in with twitter users can schedule single tweets and set up tweet automations for timed twitter posts. Tweet-O-Matic utilizes ActiveJob to execute tweets at set intervals and ActionCable + Javascript to display progress of tweet automations dynamically. This project is currently on-going and is meant as a play-ground for learning and implementing rails / javascript features.

### Key Challenges
- Building out automated tweet controller and model functionality with ActiveJob integration.
- Utilizing activeStorage within vanilla javascript to save progress bar state when changing pages / refreshing.
- Deployment to Heroku utilizing Redis for background job handling.

<!-- PROJECT BOARD -->
## Project Board
Check out the [Project board](https://github.com/elyhess/tweet_o_matic/projects/1) for a complete list of upcoming additions to this project.

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

1. Visit heroku and create an account / sign in
   ```
   https://tweet-o-matic.herokuapp.com/
   ```

<!-- CONTACT -->
## Contact
* [Ely Hess](https://github.com/elyhess) - ely.hess@me.com