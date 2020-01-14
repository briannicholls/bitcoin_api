class CLI

  def initialize
    # get data
    puts "Welcome!"
    menu
  end

  def menu
    @selection = nil
    puts "     [MAIN MENU] "
    puts "What would you like to do?"
    puts "[1] Select Symbol"
    puts "[2] View Currency Information"
    puts "[3] Select Ticker"
    #puts "[4] User Dashboard (Auth Needed)"
    puts " "
    input = gets.strip
    if input == "1"
      symbol_menu
    elsif input == '2'
      currency_menu
    elsif input == '3'
      choose(Ticker.all)
      puts ""
      puts "Selected ticker #{@selection.symbol}"
      puts ""
      menu
    elsif input == '4'
      user_menu
    elsif input == 'exit'
      exit
    else
      puts "Invalid command. Try again."
      menu
    end
  end

  def iti(input)
    input.to_i - 1
  end

  def choose(array)
    puts "Make a selection, or press return to go back."
    choice = gets
    if choice.to_i != 0 && choice.to_i <= array.length
      array[iti(choice)]
    elsif choice == "\n"
      return -1
    elsif choice == '0'
      menu
    else
      puts "Invalid selection. Try again"
      choose(array)
    end
  end

  def user_menu
    puts "Nothing here yet!"
  end

  # SYMBOL SUBMENUS
  def symbol_menu(symbol = nil)
    if !@symbol
      list = Display.list_by_id(Ssymbol.all)
      @symbol = choose(list)
      menu if symbol == -1
    end

    puts @symbol.display_details
    puts "Type 'exit' to quit"
    puts "[0] Main Menu"
    puts "[1] View Trades for #{@symbol.id}"
    puts "[2] View Order Book for #{@symbol.id}"
    puts "[3] View Candles for #{@symbol.id}"

    input = gets.strip
    if input == '0'
      menu
    elsif input == '1'
      trade_menu(Trade.all(@symbol.id))
    elsif input == '2'
      order_book_menu(OrderBook.all(@symbol.id))
    elsif input == '3'
      candles_menu(Candle.all(@symbol.id))
    elsif input == 'exit'
      exit
    else
      puts 'nope'
      symbol_menu
    end
  end
  def trade_menu(trades)
    Display.list_trades(trades)
    submenu_options

    loop do
      selection = choose(trades)
      case selection
      when -1
        symbol_menu(@symbol)
      when 'list'
        trade_menu(trades)
      end
      selection.display_details
    end
    trade_menu(trades)
  end
  def order_book_menu(orders)
    Display.list_order_book(orders)
    submenu_options

    loop do
      selection = choose(orders)
      case selection
      when -1
        symbol_menu(@symbol)
      when 'list'
        order_book_menu(orders)
      end
      selection.display_details
    end
    order_book_menu(orders)
  end
  def candles_menu(candles)
    Display.list_candles(candles)
    submenu_options

    loop do
      selection = choose(candles)
      case selection
      when -1
        symbol_menu(@symbol)
      when 'list'
        candles_menu(candles)
      end
    end
    selection.display_details
  end
  def submenu_options
    puts ""
    puts "Type 'exit' to quit"
    puts "[0] Main Menu"
    puts "Select Entry to View Details"
    puts ""
  end


  #CURRENCY SUBMENUS
  def currency_menu
    list = Display.list_by_id(Currency.all)
    submenu_options
    selection = choose(list)
    if selection == -1
      currency_menu
    elsif selection == '0'
      menu
    else
      selection.display_details
    end
    currency_menu
  end

  #TICKER SUBMENUS
  def ticker_menu

  end
end
