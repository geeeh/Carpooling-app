# Carpooling-app
[![Coverage Status](https://coveralls.io/repos/github/geeeh/Carpooling-app/badge.svg?branch=master)](https://coveralls.io/github/geeeh/Carpooling-app?branch=master)

Carpooling App is an ride sharing Application written on ruby on rails. This application enables users with rides to create rides and allow other users without vehicles to book these rides incase they are passing on the same route as their destination.

##### Link to production #####
https://cryptic-sands-26436.herokuapp.com/

#### Installation and setup ####
  To use the carpooling app locally:

  - Clone the app by running $ git clone https://github.com/geeeh/Carpooling-app.git
  - Get into the project root folder `$ cd carpooling-app`
  - Install dependencies `$ bundle install`
  - Run migrations `$ rails db:migrate `
  - Run app `$ rails server`
  To make use of Nexmo messaging:
   create a Nexmo account and include a `.env` in your project file with:

    `NEXMO_API_KEY`

    `NEXMO_API_SECRET`

#### currently working features ####
 - user authentication. This is done by devise gem.
 - user ability to create vehicles
 - Ride addition
 - Ride requests
 - Account creation
 - Notification via messaging

 #### Testing ####
 The application has built in tests that can be run by typing the following command:

 ` bundle exec rspec `

 #### contributors ####
 - Godwin Gitonga

