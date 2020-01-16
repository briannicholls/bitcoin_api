RSpec.describe Bitcoin::Currency do
  it "has an id" do
    expect(Bitcoin::Currency.new('ETH').id).to eq('ETH')
  end
end
