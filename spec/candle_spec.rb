RSpec.describe Bitcoin::Candle do
  it "can create a new Candle" do
    expect(Bitcoin::Candle.new).to be_instance_of(Bitcoin::Candle)
  end
end
