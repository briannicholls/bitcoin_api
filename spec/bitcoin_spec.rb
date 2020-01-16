RSpec.describe Bitcoin do
  it "has a version number" do
    expect(Bitcoin::VERSION).not_to be nil
  end
#
#  it "does something useful" do
#    expect(false).to eq(true)
#  end
end

RSpec.describe Currency do
  it "has an id" do
    expect(Currency.new('ETH').id).to eq('ETH')
  end

end

RSpec.describe Ssymbol do
  it "has an id" do
    expect(Ssymbol.new('BTCUSD').id).to eq('BTCUSD')
  end
end

RSpec.describe OrderBook do
end

RSpec.describe Candle do
end

RSpec.describe Trade do
end
