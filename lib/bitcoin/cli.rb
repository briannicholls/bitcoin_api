class CLI

  def initialize
    # get data
    puts "Welcome!"
    menu
  end

  def menu
    @selection = nil
    puts " "
    puts " What would you like to do?"
    puts "[1] Select Symbol"
    #puts "[2] Select Currency"
    #puts "[3] Select Ticker"
    puts "[4] User Dashboard (Auth Needed)"
    puts " "
    input = gets.strip
    if input == "1"
      @list = Display.list_by_id(Ssymbol.all)
      @selection = choose(@list)
      puts ""
      puts "Selected symbol #{@selection.id}"
      puts ""
      symbol_menu
    elsif input == '2'
      @selection = choose(Currency.all)
      puts ""
      puts "Selected currency #{@selection.id}"
      puts ""
      menu
    elsif input == '3'
      @selection = choose(Ticker.all)
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
    end

    menu if !@selection

  end

  def symbol_menu
    puts "Type 'exit' to quit"
    puts "[0] Back"
    puts "[1] View Trades for Symbol #{@selection.id}"
    #puts "[2] View Order Book for Selection"
    #puts "[3] View Candles for Selection"

    input = gets.strip
    if input == '0'
      @selection = nil
      menu
    elsif input == '1'
      @list = Trade.all(@selection.id)
      Display.list_trades(@list)
      trade_menu
    elsif input == '2'
      view_order_book
    elsif input == '3'
      view_candles
    elsif input == 'exit'
      exit
    else
      puts 'nope'
    end
    symbol_menu
  end

  def iti(input)
    input - 1
  end

  def choose(array)
    #@selection = nil
    puts "Make a selection"
    choice = gets.strip.to_i
    if choice != 0 && choice < array.length
      @selection = array[iti(choice)]
    elsif choice == 0
      @selection = nil
      menu
    else
      puts "Invalid selection. Try again"
      choose(array)
    end
  end

  def user_menu
    puts "Nothing here yet!"
  end

  def trade_menu
    puts "[0] Main Menu"
    puts "Type 'exit' to quit"
    puts "Select Trade to View Details"
    puts ""
    @selection = choose(@list)
    @selection.display_details
    trade_menu
  end

end
