class Ticker
  BASE = "https://api.exchange.bitcoin.com/api/2"
  attr_accessor :ask, :bid, :last, :open, :low, :high, :volume, :volumeQuote,
        :timestamp, :symbol

  def self.new_from_symbol_name(symbol)
    data = JSON.parse(RestClient.get("#{BASE}/public/ticker/#{symbol}"))
    Ticker.new_from_object(data)
  end

  def self.new_from_object(data)
    t = Ticker.new
    t.ask = data['ask']
    t.bid = data['bid']
    t.last = data['last']
    t.open = data['open']
    t.low = data['low']
    t.high = data['high']
    t.volume = data['volume']
    t.volumeQuote = data['volumeQuote']
    t.timestamp = Time.parse(data['timestamp'])
    t.symbol = data['symbol']
    t
  end

  def self.all
    data = JSON.parse(RestClient.get("#{BASE}/public/ticker"))
    data.map{ |ticker|
      Ticker.new_from_object(ticker)
    }
  end
end
