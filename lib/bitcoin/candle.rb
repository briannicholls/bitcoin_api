class Candle
  BASE = "https://api.exchange.bitcoin.com/api/2"

  attr_accessor :timestamp, :open, :close, :min, :max, :volume, :volumeQuote
        #:period, :sort, :from, :till, :limit, :offset

  def initialize(symbol)
    # params: period, sort, from, till, limit, offset
    data = JSON.parse(RestClient.get("#{BASE}/public/candles/#{symbol}"))
    @timestamp = data['timestamp']
    @open = data['open']
    @close = data['close']
    @min = data['min']
    @max = data['max']
    @volume = data['volume']
    @volumeQuote = data['volumeQuote']
  end

  
end
