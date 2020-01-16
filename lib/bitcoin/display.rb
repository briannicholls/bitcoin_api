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
      puts "#{(i+1).to_s.rjust(4)}. #{order.timestamp.strftime("%Y-%m-%d %H:%M:%S")}:  #{order.side.upcase} - Order Size: #{order.size.to_s.rjust(12)}, Price: #{order.price.to_s.rjust(12)}"
    }
  end

  def self.list_candles(candles)
    candles.each_with_index{ |candle, i|
      puts "#{(i+1).to_s.rjust(4)}. #{candle.timestamp} [#{candle.open.rjust(11)} -> #{candle.close.rjust(11)}] [#{candle.min.rjust(11)} - #{candle.max.rjust(11)}] vol: #{candle.volume.rjust(11)}"
    }
  end

  def self.list_tickers(tickers)
    tickers.each_with_index{ |ticker, i|
      puts "#{(i+1).to_s.rjust(4)}. #{ticker.symbol}"
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
