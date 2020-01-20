class Bitcoin::Analyzer

  # input Symbol object, prints results
  def self.analyze_trades(symbol)
    trades = Bitcoin::Trade.get_trades_in_range(symbol.id,
                                                get_datetimes_from_user)
    puts ''
    puts '///// [Analysis Results] /////'
    puts '|'
    puts '| Trade with highest price:'
    puts "| #{get_max(trades).display_details}"
    puts '| Trade with lowest price:'
    puts "| #{get_min(trades).display_details}"
    puts '| Largest trade:'
    puts "| #{get_max(trades, :quantity).display_details}"
  end

  def self.analyze_candles(symbol)
    candles = Bitcoin::Candle.new_from_range(symbol.id, get_datetimes_from_user,
                                             interval_from_user)
    return "No candles found! :(" if !candles
    puts ''
    puts '///// [Analysis Results] /////'
    puts ''
    puts "Got #{candles.length} candles from #{candles.last.timestamp} - #{candles.first.timestamp}"
    puts '|'
    puts '| Period with highest price:'
    puts "| #{get_max(candles, :max).display_details}"
    puts '| Period with lowest open:'
    puts "| #{get_min(candles, :open).display_details}"
    puts '| Period with lowest volume:'
    puts "| #{get_min(candles, :volume).display_details}"
    puts "| Average Volume: #{avg(candles, 'volume')}"
    puts '| Avg Open, Close, Min and Max:'
    puts "| #{candle_averages(candles)}"
  end

  # returns ISO formatted datetime string from user
  def self.get_datetime
    d = date_from_user
    t = time_from_user
    r = "#{d[0]}-#{d[1]}-#{d[2]}T#{t[0]}:#{t[1]}:#{t[2]}Z"
    puts "Is this correct? #{d[0]}/#{d[1]}/#{d[2]}, #{t[0]}:#{t[1]}:#{t[2]}"
    puts 'Y / N'
    gets.strip.upcase == 'Y' ? r : get_datetime
  end

  # returns 2-element array with formatted datetimes
  def self.get_datetimes_from_user
    puts '*** Enter Start Time *** (2014 or later)'
    from = get_datetime
    puts '*** Enter End Time *** (2014 or later)'
    to = get_datetime
    [from, to]
  end

  # calculate moving averages of candles array
  # return: [ open, close, min, max]
  def self.candle_averages(candles)
    result = [0, 0, 0, 0]
    candles.each do |candle|
      result[0] += candle.open.to_f
      result[1] += candle.close.to_f
      result[2] += candle.min.to_f
      result[3] += candle.max.to_f
    end
    result.map { |e| e / candles.length }
  end

  # calculate avg of attribute
  def self.avg(object_array, attribute)
    num = object_array.length
    sum = object_array.inject(0) { |memo, e| memo + e.send("#{attribute}").to_i}
    sum.to_f / num.to_f
  end

  # returns object with largest attribute
  def self.get_max(object_array, attribute = :price)
    object_array.max_by{ |e| e.send("#{attribute}") }
  end

  # returns object with smallest attribute
  def self.get_min(object_array, attribute = :price)
    object_array.min_by{ |e| e.send("#{attribute}") }
  end

  # returns time in array format ['HH', 'MM', 'SS']
  def self.time_from_user
    puts 'Enter Time (24-hour format) (hh mm ss)'
    t = gets.strip.split(' ')
    if !t[0].to_i.between?(0, 23) || !t[1].to_i.between?(0, 59) || !t[2].to_i.between?(0, 59) || t[0].length != 2 || t[1].length != 2 || t[2].length != 2
      puts 'Invalid time.'
      time_from_user
    end
    t
  end

  # returns date in array format ['YYYY', 'MM', 'DD']
  def self.date_from_user
    puts 'Enter Year (YYYY MM DD)'
    d = gets.strip.split(' ')
    if d[0].to_i < 2014 || !d[1].to_i.between?(1, 12) || !d[2].to_i.between?(1, 31) || d[0].length != 4 || d[1].length != 2 || d[2].length != 2
      puts 'Invalid Date. Try Again'
      date_from_user
    end
    d
  end

  def self.interval_from_user
    puts 'Enter time interval. Accepted values:'
    puts '  M1 (one minute), M3, M5, M15, M30, '
    puts '  H1 (one hour), H4, '
    puts '  D1 (one day), D7, '
    puts '  1M (one month)'
    valid = ['M1', 'M3', 'M5', 'M15', 'M30', 'H1', 'H4', 'D1', 'D7', '1M']
    input = gets.strip
    interval_from_user if !valid.any?(input)
    input
  end

end
