RSpec.describe Bitcoin::Candle do
  it "can create new Candles" do
    expect(Bitcoin::Candle.new).to eq(true)
  end
end
