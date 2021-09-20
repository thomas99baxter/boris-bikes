require "bike"
test_bike = nil

describe 'Bike' do
  before(:each) do 
    test_bike = Bike.new()
  end

  it "should return a bike" do
    expect(test_bike.working?).to eq true
  end
end