class Currency
  BASE = "https://api.exchange.bitcoin.com/api/2"
  attr_accessor :id, :fullName, :crypto, :payinEnabled, :payinPaymentId,
      :payinConfirmations, :payoutEnabled, :payoutIsPaymentId, :transferEnabled,
      :delisted, :payoutFee

  def self.all
    data = JSON.parse(RestClient.get("#{BASE}/public/currency"))
    data.map{  |currency|
      Currency.new_from_object(currency)
     }
  end

  def self.new_from_currency_name(name)
    data = JSON.parse(RestClient.get("#{BASE}/public/currency/#{name}"))
    Currency.new_from_object(data)
  end

  def self.new_from_object(data)
    c = Currency.new
    c.id = data['id']
    c.fullName = data['fullName']
    c.crypto = data['crypto']
    c.payoutFee = data['payoutFee']
    c
  end

  def display_details
    puts <<-DOC
      #{@id} (#{@fullName})
      Cryptocurrency?: #{@crypto.to_s}
      Delisted?: #{@delisted.to_s}
      Pay-Out Fee: #{@payoutFee} #{@id}
    DOC
  end

end
