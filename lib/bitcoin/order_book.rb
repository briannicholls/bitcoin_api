class OrderBook
  BASE = "https://api.exchange.bitcoin.com/api/2"

  attr_accessor :side, :price, :size, :timestamp, :limit, :symbol

  # Params:
  # limit :	Number	Limit of Order Book levels
  #         Default value: 100
  #         Set 0 to view full list of Order Book levels.

  def self.new_from_object(object)
    o = OrderBook.new
    o.size = object['size']
    o.side = object[:side]
    o.price = object['price']
    o.timestamp = Time.parse(object['timestamp'])
    o.limit = object['limit']
    o.symbol = object[:symbol]
    o
  end

  def self.all(symbol)
    data = JSON.parse RestClient.get "#{BASE}/public/orderbook/#{symbol}?limit=0"
    ask_orders = data['ask']
    bid_orders = data['bid']

    ask_orders.each{ |order|
      order[:side] = 'ask'
      order['timestamp'] = data['timestamp']
      order[:symbol] = symbol
    }
    bid_orders.each{ |order|
      order[:side] = 'bid'
      order['timestamp'] = data['timestamp']
      order[:symbol] = symbol
    }

    [ask_orders, bid_orders].flatten!.map{|order|
      OrderBook.new_from_object(order)
    }
  end

  def display_details
    puts <<-DOC
    #{@symbol} #{@side.upcase} Order:
    #{@price}
    Quantity: #{@size}
    #{@timestamp}

    DOC
  end
end
