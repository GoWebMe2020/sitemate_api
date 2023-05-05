# Sitemate Test

This test is a basic application to allow a user to create, update, read and delete an Issue. This was built using Ruby on Rails, HTML/ERB and CSS.

The backend will except and return JSON for the get, post, put and delete requests. To test this, I used Postman (https://www.postman.com/).

Unfortunately, I only managed to create the index page to return and display all the issues, in the given time.

## Setup

#### Prerequisites

 * Ruby 2.7.0 or later
 * Rails 6.0.0 or later
 * Postgres 9.5 or later

#### Clone the Repo

  * clone this repo `git clone git@github.com:GoWebMe2020/sitemate_api.git`

#### Install Dependencies

 * `bundle install`

#### Setup DB

  * Run `rails db:create`
  * Then run `rails db:migrate`
  * Run `rails db:seed`

#### Run the Server

  * Run `rails s`

#### Run Tests

  * Run `rails test` and you will hopefully see 5 green dots at the end.


