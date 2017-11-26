# wattics-api-client-java

This project is created for Wattics Ltd. Here I ported [API Java Library](https://github.com/Wattics/api-client-java) into Ruby API Library. The Gem serves to send energy data into Wattics API platform.

## Installation

Once you clone the library into your local drive you can run the following

```sh
$ cd wattics-api-client-ruby
$ rake install api-client-ruby
```

You can use the example file from now on. If you decide to play with it locally, run your local server on `localhost:4567` and if you use Sinatra, set up the following code on your Sinatra server so it can accept data you send

```ruby
require 'sinatra'
require 'json'

post '/readjson' do
    data = JSON.parse request.body.read
    puts data
end
```

OR, go to:  

```sh
$ cd lib/wattics
```

and comment line with mydev (which is local server), into line with `'development'` environment in `example.rb`. You can change the values in simple_mesurement object as necessary.

```ruby
# config = Config.new('production', "username", "password")
# config = Config.new('development', "username", "password")
config = Config.new('mydev', "username", "password")

simple_measurement = SimpleMeasurement.new
simple_measurement.set_id("meter-id-01")
simple_measurement.set_timestamp
simple_measurement.value = 12.5
agent.send(simple_measurement, config)
```

Once it's done, send the data

```sh
$ cd lib/wattics
$ ruby example.rb
```


## Running the tests (in production)

Only the first test (out of 3) is ready for execution.

```sh
$ rspec
```

## Current issues
* The library uses basic functionality of Faraday gem. The original [API Java Library](https://github.com/Wattics/api-client-java) is based on HTTP Client which is able to send requests in concurrent and multithreaded way. One of my suggestions would be to experiment with ruby-concurrency gem ie. (CountDownLatch class) or JRuby.
* Due to the above fact, RSpec tests include only one test checking successful status of sent requests. Checking if processor is idle after sending requests or checking if measurements are sorted before sending is due to be finished.
* The functionality of sorting measurements by date is not completed yet. (the method send_collection(measurement_list, config) in agent.rb is a starting point to this.)


## Contributing

The original library  [api-client-java](https://github.com/Wattics/api-client-java) belongs to Wattics Ltd and the following code is ported from that into Ruby by [Dariusz Biskupski](http://dariuszbiskupski.com).
