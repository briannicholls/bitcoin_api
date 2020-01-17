class Bitcoin::Ticker

  attr_accessor :ask, :bid, :last, :open, :low, :high, :volume, :volumeQuote, :timestamp, :symbol

  def display_details
    puts <<-DOC
    #{@symbol}
    Best Ask   : #{@ask.to_s.rjust(9)} || Best Bid: #{@bid}
    Last Trade Price: #{@last}
    Open: #{@open}
    24-Hour Low: #{@low.to_s.rjust(9)} || 24-Hour High: #{@high}
    Total 24-Hour Volume (Base): #{@volume}  (Quote): #{@volumeQuote}
    #{@timestamp}

    DOC
  end

  def self.new_from_object(data)
    t = Bitcoin::Ticker.new
    t.ask = data['ask'].to_f
    t.bid = data['bid'].to_f
    t.last = data['last'].to_f
    t.open = data['open'].to_f
    t.low = data['low'].to_f
    t.high = data['high'].to_f
    t.volume = data['volume'].to_f
    t.volumeQuote = data['volumeQuote'].to_f
    t.timestamp = Time.parse(data['timestamp'])
    t.symbol = data['symbol']
    t
  end

  def self.new_from_symbol_name(symbol_name)
    data = JSON.parse(RestClient.get("#{Bitcoin::BASE}/public/ticker/#{symbol_name}"))
    Bitcoin::Ticker.new_from_object(data)
  end

  def self.all
    data = JSON.parse(RestClient.get("#{Bitcoin::BASE}/public/ticker"))
    data.map{ |ticker|
      Bitcoin::Ticker.new_from_object(ticker)
    }
  end


end
