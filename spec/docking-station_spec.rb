require "docking-station"
test_docking_station = nil

describe 'DockingStation' do
  before(:each) do 
    test_docking_station = DockingStation.new()
  end

  it "should return a bike" do
    expect(test_docking_station.release_bike).to eq "bike"
  end
end