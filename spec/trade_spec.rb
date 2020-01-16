RSpec.describe Bitcoin::Trade do
  it "can create a new Trade" do
    expect(Bitcoin::Trade.new).to be_instance_of(Bitcoin::Trade)
  end
end
