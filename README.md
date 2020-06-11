[![Gem Version](https://badge.fury.io/rb/bitcoin-api.svg)](https://badge.fury.io/rb/bitcoin-api)

# Bitcoin

This is a CLI using the bitcoin.com exchange API to view market data and provide limited analysis.

CLI Demo video: https://youtu.be/K46q4ZAS6SI

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

To start the CLI, navigate to the root directory in your terminal and run `bin/bitcoin`

You can also run `bin/console` to play around. For the API documentation, [See Here](https://www.rubydoc.info/gems/bitcoin-api/0.1.1)

## Add API Key / Secret

While not required to view market data, you can add your personal API key to view and manage your own account on Bitcoin.com

Get your API Key and secret from your account settings at https://exchange.bitcoin.com/settings/api-keys.

Create a file named `.env` in root directory. The contents should look like this:

```
API_KEY=123456789
SECRET=123456789
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nichol88/bitcoin_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
