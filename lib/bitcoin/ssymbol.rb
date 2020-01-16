class Bitcoin::Ssymbol

  attr_accessor :id, :baseCurrency, :quoteCurrency, :quantityIncrement, :tickSize,
        :takeLiquidityRate, :provideLiquidityRate, :feeCurrency

  def self.all
    data = JSON.parse(RestClient.get("#{Bitcoin::BASE}/public/symbol"))
    data.map{ |ssymbol|
      Bitcoin::Ssymbol.new_from_object(ssymbol)
    }
  end

  def self.new_from_object(data)
    s = Bitcoin::Ssymbol.new
    s.id = data['id']
    s.baseCurrency = data['baseCurrency']
    s.quoteCurrency = data['quoteCurrency']
    s.quantityIncrement = data['quantityIncrement']
    s.tickSize = data['tickSize']
    s.takeLiquidityRate = data['takeLiquidityRate']
    s.provideLiquidityRate = data['provideLiquidityRate']
    s.feeCurrency = data['feeCurrency']
    s
  end

  def self.new_from_symbol_name(symbol_name)
    data = JSON.parse(RestClient.get("#{Bitcoin::BASE}/public/symbol/#{symbol_name}"))
    Bitcoin::Ssymbol.new_from_object(data)
  end

  def display_details
    puts <<-DOC
    ID: #{@id}
    Base Currency: #{@baseCurrency} || Quote Currency: #{@quoteCurrency}
    Quantity Increment: #{@quantityIncrement} || Tick Size: #{@tickSize}
    Take Liquidity Rate: #{@takeLiquidityRate} || Provide Liquidity Rate: #{@provideLiquidityRate}
    Fee Currency: #{@feeCurrency}

    DOC

  end

end
