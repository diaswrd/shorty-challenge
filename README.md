# Shorty Challenge

A simple URL shortener service

## Briefing

The specification of this project can be found [on this gist](https://gist.github.com/vasc/37f36488fc9e959dcaf8).

## How to use

There is 2 ways to use this service, one is communicating with POST/GET messages to your local server. Like this way:
````
$ curl -X POST -H "Content-Type: application/json" -d '{"shorten": { "url": "http://example.com", "shortcode": "example" }}' localhost:3000/shortens
````

And another is through a very modest web interface:
    [https://peaceful-garden-8759.herokuapp.com/shortens](https://peaceful-garden-8759.herokuapp.com/shortens)

## Deploy

If you want to deploy this project in your machine to run locally, follow the steps above:

### Check your Ruby and Rails versions
    $ ruby --version
    ruby 2.0.0p481 (2014-05-08 revision 45883) [universal.x86_64-darwin13]
    $ rails --version
    Rails 4.1.7

### Clone this project to your computer
    $ git clone git@github.com:diaswrd/shorty-challenge.git

### Install ruby gems bundle
    $ cd shorty-challenge && bundle install

### Run database migrations
    $ rake db:migrate

### Start rails server
    $ rails server

### Profit
Access [http://localhost:3000/](http://localhost:3000/) in your favorite modern browser and you will probably see the service up and running.
This micro service was developed and tested on Mac OSX 10.9.5.

### Running tests
    $ bundle exec rspec
    ..........

    Finished in 0.13542 seconds (files took 1.58 seconds to load)
    10 examples, 0 failures

### Thanks
Thanks to Filipe Dobreira and Vasco Fernandes for making this challenge very fun and interesting to develop.
