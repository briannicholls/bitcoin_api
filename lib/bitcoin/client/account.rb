class Bitcoin::Account

  def self.show_balances
    request = JSON.parse RestClient::Request.new(
      :method => :get,
      :url => "#{Bitcoin::BASE}/account/balance",
      :user => ENV['API_KEY'],
      :password => ENV['SECRET'],
      :verify_ssl => false
    ).execute

    puts "Currency | Available:"
    puts "---------|-----------"
    request.each{ |e|
      puts "#{e['currency'].rjust(8)} | #{e['available']}"
      #puts "Reserved: #{e['reserved']}"
    }
  end

  def self.show_deposit_address(currency_symbol = nil)
    puts "Enter currency symbol:" if !currency_symbol
    currency_symbol = gets.strip if !currency_symbol

    request = JSON.parse RestClient::Request.new(
      :method => :get,
      :url => "#{Bitcoin::BASE}/account/crypto/address/#{currency_symbol}",
      :user => ENV['API_KEY'],
      :password => ENV['SECRET'],
      :verify_ssl => false
    ).execute
    puts ''
    puts '************************************************'
    puts "*    Address: #{request['address']}"
    puts "* Payment ID: #{request['paymentId']}"
    puts '************************************************'
  end



end
