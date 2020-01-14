class OrderBook
  BASE = "https://api.exchange.bitcoin.com/api/2"

  attr_accessor :ask, :bid, :price, :size, :timestamp, :limit

  # Params:
  # limit :	Number	Limit of Order Book levels
  #         Default value: 100
  #         Set 0 to view full list of Order Book levels.
  def initialize(symbol)
    url = "#{BASE}/public/orderbook/#{symbol}"
    url_with_params = "#{url}#{params}"

    data = JSON.parse(RestClient.get(url))
    @ask = data['ask']
    @bid = data['bid']
    @timestamp = data['timestamp']
    @limit = data['limit']
  end
end
