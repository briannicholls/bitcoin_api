class Bitcoin::Analyzer

  def self.get_max(object_array, attribute = :price)
    object_array.max_by{ |e|
      e.send("#{attribute}")
    }
  end

  def self.get_min(object_array, attribute = :price)
    object_array.min_by{ |e|
      e.send("#{attribute}")
    }
  end

  def self.analyze_trades(symbol)
    trades = Bitcoin::Trade.get_trades_in_range(symbol.id)
    puts ""
    puts " ///// [Analysis Results] /////"
    puts "|"
    puts "| Trade with highest price:"
    puts "| #{self.get_max(trades).display_details}"
    puts "| Trade with lowest price:"
    puts "| #{self.get_min(trades).display_details}"
    puts "| Largest trade:"
    puts "| #{self.get_max(trades, :quantity).display_details}"
  end

end
