RSpec.describe Bitcoin::Currency do
  it "can create a new Currency" do
    expect(Bitcoin::Currency.new).to be_instance_of(Bitcoin::Currency)
  end
end
