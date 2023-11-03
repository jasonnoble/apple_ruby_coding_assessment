# Coding Assignment

This Ruby on Rails application accepts an address as input. 
As the user types in the address, it uses Google Maps API to
auto complete the address. Once the user selects an address
from the drop down list, the app fetches the current weather
for that address, along with the forecast for the next 7 days
(including the current date). It then updates the webpage to
show the data retrieved.

## Setup

1. Clone the repo `git clone git@github.com:jasonnoble/apple_ruby_coding_assessment.git`
1. Add the master.key file
    1. echo 'KEY_VALUE' > config/master.key
1. Run the server
   1. `bin/dev`


## Load webpage

[http://localhost:3000/](http://localhost:3000)

## Enter an address

Click in the input field and start typing an
address. Once you see the address you'd like, 
click on the address and you will be shown the
current temperature as well as the forecasted
High and Low for the next week.

## Requirements

One of the requirements was that we cache the weather
data by zip codes and indicate the if the weather displayed
was from cached data.

I implemented this via `Rails.cache.fetch` in the `WelcomeController`.
I also modified the view so that it displays a gradient behind the 
weather data when it was fetched from cache.


