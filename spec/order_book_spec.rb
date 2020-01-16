RSpec.describe Bitcoin::OrderBook do
  it "can create new order books" do
    expect(Bitcoin::OrderBook.new).to eq(true)
  end
end
