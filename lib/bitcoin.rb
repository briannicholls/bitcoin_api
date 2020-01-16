require 'rest-client'
require 'json'
require 'pry'
require 'net/http'
require 'uri'
require 'time'


#require_relative "./bitcoin/version"
require_relative "./bitcoin/version.rb"
require_relative "./bitcoin/display.rb"
require_relative "./bitcoin/cli.rb"
require_relative "./bitcoin/currency.rb"
require_relative "./bitcoin/order_book.rb"
require_relative "./bitcoin/trade.rb"
require_relative "./bitcoin/ssymbol.rb"
require_relative "./bitcoin/candle.rb"
require_relative "./bitcoin/ticker.rb"
require_relative "./bitcoin/analyzer.rb"


module Bitcoin

  class Error < StandardError; end
  # Your code goes here...
  BASE = "https://api.exchange.bitcoin.com/api/2"
  def self.get_datetime
    puts "Enter Date (YYYY MM DD)"
    d = gets.strip
    puts "Enter Time (24-hour format) (hh mm ss)"
    t = gets.strip
    d = d.split(" ")
    t = t.split(" ")
    r = "#{d[0]}-#{d[1]}-#{d[2]}T#{t[0]}:#{t[1]}:#{t[2]}Z"
    puts "Is this correct? #{d[0]}/#{d[1]}/#{d[2]}"
    puts "Y / N"
    gets.strip.upcase == 'Y' ? return r : self.get_datetime
  end

  # returns 2-element array with datetimes in ISO format
  def self.get_datetimes_from_user
    puts "*** Enter Start Time *** (2014 or later)"
    from = Bitcoin.get_datetime
    puts "*** Enter End Time *** (2014 or later)"
    to = Bitcoin.get_datetime
    return [from, to]
  end

end
