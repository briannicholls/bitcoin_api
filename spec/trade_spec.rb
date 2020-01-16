RSpec.describe Bitcoin::Trade do
  it "creates new Trades" do
    expect(Bitcoin::Trade.new).to eq(true)
  end
end
