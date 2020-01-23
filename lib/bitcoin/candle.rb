class Bitcoin::Candle

  attr_accessor :timestamp, :open, :close, :min, :max, :volume, :volumeQuote, :interval

  def display_details
    puts <<-DOC
    #{@timestamp}
    Open: #{@open} || Close: #{@close}
    Min: #{@min} || Max: #{@max}
    Volume: #{@volume} || Volume Quote: #{@volumeQuote}

    DOC
  end

  def self.new_from_object(object)
    c = Bitcoin::Candle.new
    c.timestamp = Time.parse(object['timestamp'])
    c.open = object['open']
    c.close = object['close']
    c.min = object['min']
    c.max = object['max']
    c.volume = object['volume']
    c.volumeQuote = object['volumeQuote']
    c
  end

  def self.all(symbol)
    data = JSON.parse(RestClient.get("#{Bitcoin::BASE}/public/candles/#{symbol}?limit=1000"))
    data.map{ |candle|
      Bitcoin::Candle.new_from_object(candle)
    }
  end

  # returns array of candles between two datetimes
  def self.new_from_range(symbol_name, timestamps, interval = '30M')
    url = "#{Bitcoin::BASE}/public/candles/#{symbol_name}?limit=1000&sort=DESC"
    params = "&from=#{timestamps[0]}&till=#{timestamps[1]}&period=#{interval}"
    params = params.gsub(':', '%3A')
    data = JSON.parse RestClient.get("#{url}#{params}")
    if !data || data.empty?
      puts ''
      puts '*** No data found! Press enter to continue. ***'
      gets
      return nil
    else
      data.map { |e| Bitcoin::Candle.new_from_object(e) }
    end
  end
end
