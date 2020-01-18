class Bitcoin::Analyzer

  # input Symbol object, prints results
  def self.analyze_trades(symbol)
    trades = Bitcoin::Trade.get_trades_in_range(symbol.id)
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

  # returns 2-element array with datetimes in ISO format ()
  def self.get_datetimes_from_user
    puts "*** Enter Start Time *** (2014 or later)"
    from = get_datetime
    puts "*** Enter End Time *** (2014 or later)"
    to = get_datetime
    return [from, to]
  end

  # calculate moving average between two dates

  private

  def self.get_max(object_array, attribute = :price)
    object_array.max_by{ |e|
      e.send("#{attribute}")
    }
  end

  def self.get_min(object_array, attribute = :price)
    object_array.min_by{ |e|
      e.send("#{attribute}")
    }
  end
end
