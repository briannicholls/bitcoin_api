class Trade

  BASE = "https://api.exchange.bitcoin.com/api/2"

  attr_accessor :id, :price, :quantity, :side, :timestamp, :symbol

  def initialize(symbol)
    # params: sort, by, from, till, limit, offset
    @symbol = symbol

  end

  def self.new_from_object(symbol, data)
    t = Trade.new(symbol)
    t.id = data['id']
    t.price = data['price']
    t.quantity = data['quantity']
    t.side = data['side']
    t.timestamp = Time.parse(data['timestamp'])
    t
  end

  def self.all(symbol)
    data = JSON.parse RestClient.get("#{BASE}/public/trades/#{symbol}")
    data.map{ |trade|
      t = Trade.new_from_object(symbol, trade)
      t
    }
  end

  def display_details
    puts <<-DOC
    #{@symbol}
    #{@id} : #{@side.upcase} : #{@price} #{@symbol[0..2]}
    quantity: #{@quantity}
    #{@timestamp}

    DOC
  end

end
