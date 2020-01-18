require 'rest-client'
require 'json'
require 'pry'
require 'net/http'
require 'uri'
require 'time'

# require_relative "./bitcoin/version"
require_relative './bitcoin/version.rb'
require_relative './bitcoin/display.rb'
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

  # returns formatted datetime string
  def self.get_datetime
    d = get_date_from_user
    t = get_time_from_user
    r = "#{d[0]}-#{d[1]}-#{d[2]}T#{t[0]}:#{t[1]}:#{t[2]}Z"
    puts "Is this correct? #{d[0]}/#{d[1]}/#{d[2]}, #{t[0]}:#{t[1]}:#{t[2]}"
    puts 'Y / N'
    gets.strip.upcase == 'Y' ? r : get_datetime
  end

  def self.get_time_from_user
    puts 'Enter Time (24-hour format) (hh mm ss)'
    t = gets.strip.split(' ')
    if !t[0].to_i.between?(0, 23) || !t[1].to_i.between?(0, 59) || !t[2].to_i.between?(0, 59) || t[0].length != 2 || t[1].length != 2 || t[2].length != 2
      puts 'Invalid time.'
      get_datetime
    end
    t
  end

  def self.get_date_from_user
    puts 'Enter Year (YYYY MM DD)'
    d = gets.strip.split(' ')
    if d[0].to_i < 2014 || !d[1].to_i.between?(1, 12) || !d[2].to_i.between?(1, 31) || d[0].length != 4 || d[1].length != 2 || d[2].length != 2
      puts 'Invalid Date. Try Again'
      get_date_from_user
    end
    d
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
