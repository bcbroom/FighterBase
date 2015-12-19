# FighterBase

Wrapper methods for interacting with the APIs in the Stockfighter.io game.

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

`level = FighterBase::Level.new(api_key, account, venue_symbol)`

Creating a Level instance also creates an Exchange instance of the given venue. You need the Exchange instance to get quotes and place orders.

### Exchange

Most interaction will be through this class. Quote for a stock, orderbook for a stock, place an order, cancel an order is done here. Methods return JSON from the APIs parsed into a hash.

`ex = level.exchange`

`quote = ex.get_quote("FAC")`

then get information from it as

`quote["ask"]` or `quote["bid_size"]`

### Order

Class is not implemented yet - still working how to model them in this system.

Orders can be placed and canceled through the `Exchange` insance

`order = ex.place_order(stock: symbol, price: ask, qty: size, direction: "buy", type: "limit")`

_Note:_ `Exchange#place_order` currently returns a hash. In the future it will return a propper `Order` instance.

_Note:_ Order method uses named argument style method. The rest of the methods will soon switch to that style.

## Notes

There are still some parts that I'm not certain about. If you create an order with `Order#new`, then place it on a venue and it is partially filled. When you look at properties of the order, it won't be updated.

Maybe the order instances should be able to update themselves, because they know the venue they were placed on?

Its probably best to think of the Order instance as a cache, and the real data is kept on the server.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fighter_base.

