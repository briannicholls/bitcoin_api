require 'rest-client'
require 'json'
require 'pry'
require 'net/http'
require 'uri'
require 'time'

# require_relative "./bitcoin/version"
require_relative './bitcoin/version.rb'
require_relative './bitcoin/cli.rb'
require_relative './bitcoin/currency.rb'
require_relative './bitcoin/order_book.rb'
require_relative './bitcoin/trade.rb'
require_relative './bitcoin/ssymbol.rb'
require_relative './bitcoin/candle.rb'
require_relative './bitcoin/ticker.rb'
require_relative './bitcoin/analyzer.rb'
require_relative './bitcoin/client/account.rb'

module Bitcoin
  class Error < StandardError; end
  # Your code goes here...
  BASE = 'https://api.exchange.bitcoin.com/api/2'
end
