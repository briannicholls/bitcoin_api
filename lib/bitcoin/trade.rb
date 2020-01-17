class Bitcoin::Trade

  attr_accessor :id, :price, :quantity, :side, :timestamp, :symbol

  def display_details
    puts <<-DOC
  | #{@symbol}
  | ID: #{@id} : #{@side.upcase} : #{@price}
  | Quantity: #{@quantity}
  | #{@timestamp}
  |_____________________
    DOC
  end

  def self.new_from_object(symbol_name, data)
    t = Bitcoin::Trade.new
    t.id = data['id']
    t.price = data['price'].to_f
    t.quantity = data['quantity'].to_f
    t.side = data['side']
    t.timestamp = Time.parse(data['timestamp'])
    t.symbol = symbol_name
    t
  end

  def self.all(symbol_name)
    data = JSON.parse RestClient.get("#{Bitcoin::BASE}/public/trades/#{symbol_name}?limit=1000")
    data.map{ |e|
      Bitcoin::Trade.new_from_object(symbol_name, e)
    }
  end

  # Input: currency pair and formatted date range. Output: array of trades from range
  def self.get_trades_in_range(symbol_name, timestamps = Bitcoin.get_datetimes_from_user)
    data = JSON.parse RestClient.get "#{Bitcoin::BASE}/public/trades/#{symbol_name}?limit=1000&sort=DESC&from=#{timestamps[0]}&till=#{timestamps[1]}"
    data.map{|e|
      Bitcoin::Trade.new_from_object(symbol_name, e)
    }
  end

end
