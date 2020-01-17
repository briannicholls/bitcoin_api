class Bitcoin::Candle

  attr_accessor :timestamp, :open, :close, :min, :max, :volume, :volumeQuote

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

  def self.get_from_range(symbol_name, timestamps = Bitcoin.get_datetimes_from_user)
    data = JSON.parse RestClient.get "#{Bitcoin::BASE}/public/candles/#{symbol_name}?limit=1000&sort=DESC&from=#{timestamps[0]}&till=#{timestamps[1]}"
    data.map{|e|
      Bitcoin::Trade.new_from_object(symbol_name, e)
    }
  end

end
