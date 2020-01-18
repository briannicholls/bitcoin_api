class CoinMarketCap
  BASE_URL = 'https://pro-api.coinmarketcap.com'
  # /v1/exchange/map - CoinMarketCap ID map
  # /v1/exchange/info - Metadata
  # /v1/exchange/listings/latest - Latest listings
  # /v1/exchange/listings/historical - Historical listings
  # /v1/exchange/quotes/latest - Latest quotes
  # /v1/exchange/quotes/historical - Historical quotes
  # /v1/exchange/market-pairs/latest - Latest market pairs

  data = JSON.parse(RestClient.get("#{Bitcoin::BASE}/public/candles/#{symbol}?limit=1000"))
end
