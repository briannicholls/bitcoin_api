class Candle
  BASE = "https://api.exchange.bitcoin.com/api/2"

  attr_accessor :timestamp, :open, :close, :min, :max, :volume, :volumeQuote
        #:period, :sort, :from, :till, :limit, :offset

  def self.all(symbol)
    data = JSON.parse(RestClient.get("#{BASE}/public/candles/#{symbol}?limit=1000"))
    data.map{ |candle|
      Candle.new_from_object(candle)
    }
  end

  def self.new_from_object(object)
    c = Candle.new
    c.timestamp = object['timestamp']
    c.open = object['open']
    c.close = object['close']
    c.min = object['min']
    c.max = object['max']
    c.volume = object['volume']
    c.volumeQuote = object['volumeQuote']
    c
  end

  def display_details
    puts <<-DOC
    #{@timestamp}
    Open: #{@open} || Close: #{@close}
    Min: #{@min} || Max: #{@max}
    Volume: #{@volume} || Volume Quote: #{@volumeQuote}

    DOC
  end
end
