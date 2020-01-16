RSpec.describe Bitcoin::Ssymbol do
  it "can create a new Ssymbol" do
    expect(Bitcoin::Ssymbol.new).to be_instance_of(Bitcoin::Ssymbol)
  end
end
