class Display

  def self.list(array)
    numerize(array)
  end

  def self.list_by_symbol(array)
    numerize(array, :symbol)
  end

  def self.list_by_id(array)
    numerize(array, :id)
  end

  def self.list_trades(trades)
    trades.each_with_index{ |trade, i|
      puts "#{(i+1).to_s.rjust(4)}. #{trade.timestamp.strftime("%Y-%m-%d %H:%M:%S")} #{trade.side.rjust(4)} #{trade.price}"
    }
  end

  def self.list_order_book(orderbook)
    orderbook.each_with_index{ |order, i|
      puts "#{(i+1).to_s.rjust(4)}. #{order.timestamp.strftime("%Y-%m-%d %H:%M:%S")}:  #{order.side.upcase} - Order Size: #{order.size.rjust(12)}, Price:  #{order.price.rjust(4)}"
    }
  end

  def self.list_candles(candles)
    candles.each_with_index{ |candle, i|
      puts "#{(i+1).to_s.rjust(4)}. #{candle.timestamp} [#{candle.open.rjust(7)} -> #{candle.close.rjust(7)}] [#{candle.min.rjust(7)} - #{candle.max.rjust(7)}] vol: #{candle.volume.rjust(11)}"
    }
  end

  private
  # input array of hashes, and desired displayed attribute (string key)
  def self.numerize(array, attribute = nil)
    if attribute
      array.each_with_index{ |e, i| puts "#{i+1}. #{e.send("#{attribute}")}"}
    else
      array.each_with_index{ |e, i| puts "#{i+1}. #{e}"}
    end
  end

end
