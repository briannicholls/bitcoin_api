RSpec.describe Bitcoin::Ssymbol do
  it "has an id" do
    expect(Bitcoin::Ssymbol.new('BTCUSD').id).to eq('BTCUSD')
  end
end
