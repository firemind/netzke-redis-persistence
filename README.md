netzke-redis-persistence
========================

Implementation of netzke-persistence with redis as data store.


## Installation

Add this to your Gemfile and run bundle install

    gem 'netzke-redis-persistence'

Don't forget to install the redis server.

## Configuration

If you are not using redis on localhost you can override the connection with an initializer:

 NetzkeRedisPersistence.configure do |config|
   config.redis_connection = Redis.new
 end

