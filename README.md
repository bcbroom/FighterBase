# FighterBase

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fighter_base`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fighter_base'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fighter_base

## Usage

The main classes are 

### Level

Stores the `api_key`, and trading account

### Venue

Most interaction will be through this class. Quote for a stock, orderbook for a stock, place an order, cancel an order is done here.

### Order

Create orders, then place them using Venue#place_order

## Notes

There are still some parts that I'm not certain about. If you create an order with `Order#new`, then place it on a venue and it is partially filled. When you look at properties of the order, it won't be updated.

Maybe the order instances should be able to update themselves, because they know the venue they were placed on?

Its probably best to think of the Order instance as a cache, and the real data is kept on the server.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fighter_base.

