https://badge.fury.io/rb/bitcoin-api.svg

# Bitcoin

This is a CLI using the bitcoin.com exchange API to view market data and provide limited analysis.

CLI Demo video: https://youtu.be/z5k0Hnl88eA

Planned features:
  - More advanced analytical functions
  - Support for trading
  - Support for multiple exchanges
  - Algotrading, arbitrage
  - UI

Walkthrough of source code: https://youtu.be/TuTf84mZAEY

Blog Post: https://briannicholls.home.blog/2020/01/18/cli-project-bitcoin-com-crypto-api/

## Installation

Add this line to your application's Gemfile:
    ```ruby
    gem 'bitcoin-api'
    ```
And then execute:
    ```
    $ bundle install
    ```

Or install it yourself as:

    $ gem install bitcoin-api


## Usage

In your code use:

    ```ruby
    require 'bitcoin'

    Bitcoin::CLI.new # to start the CLI
    ```

If you've cloned the repo, run `bin/console` to play around, or `bin/bitcoin` to start the CLI.

## Add API Key / Secret

Get your API Key and secret from your account settings at https://exchange.bitcoin.com/settings/api-keys.

Create a file named `.env` in root directory. The contents should look like this:

```ruby
API_KEY={your API key (no quotes or brackets)}
SECRET={your Secret key (no quotes or brackets)}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nichol88/bitcoin_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
