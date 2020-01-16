RSpec.describe Bitcoin::OrderBook do
  it "can create a new OrderBooks" do
    expect(Bitcoin::OrderBook.new).to be_instance_of(Bitcoin::OrderBook)
  end
end
