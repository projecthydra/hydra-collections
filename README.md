# Hydra::Collections

TODO: Write a gem description

## Code Status

[![Build Status](https://travis-ci.org/psu-stewardship/hydra-collections.png?branch=master)](https://travis-ci.org/psu-stewardship/hydra-collections)
[![Dependencies Status](https://gemnasium.com/psu-stewardship/hydra-collections.png)](https://gemnasium.com/psu-stewardship/hydra-collections)

## Installation

Add this line to your application's Gemfile:

    gem 'hydra-collections'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hydra-collections

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Setup instructions for Contributors

In order to make modifications to the gem code and run the tests, clone the repository then

```
    $ bundle install
    $ git submodule init
    $ git submodule update
    $ rake jetty:config
    $ rake jetty:start
    $ rake clean 
    $ rake spec
```