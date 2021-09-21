require "docking-station"
require "bike"
test_docking_station = nil

describe 'DockingStation' do
  before(:each) do 
    test_docking_station = DockingStation.new(Bike.new)
  end

  it "should return a bike" do
    result = test_docking_station.release_bike
    expect(result.is_a? Bike).to eq true
  end

  it "will push a bike to an array when docked" do
    test_docking_station.dock_bike(test_docking_station.release_bike)
    result = test_docking_station.get_docked_bikes
    expect(result.is_a? Array).to eq true
  end

  it "will push a bike to an array when docked" do
    test_docking_station.dock_bike(test_docking_station.release_bike)
    test_docking_station.dock_bike(test_docking_station.release_bike)
    test_docking_station.dock_bike(test_docking_station.release_bike)
    result = test_docking_station.get_docked_bikes
    expect(result.length).to eq 3
  end
  
  it "will push a bike to an array when docked" do
    test_docking_station.dock_bike(Bike.new)
    test_docking_station.dock_bike(Bike.new)
    result = test_docking_station.get_docked_bikes
    result.each do |bike|
      expect(bike.is_a? Bike).to eql true
    end
  end
  it "error testing" do
    test_docking_station.release_bike
    test_docking_station.release_bike
    test_docking_station.release_bike
    expect{test_docking_station.release_bike}.to raise_error("No bikes in storage")
  end

  it "error testing" do
    test_docking_station.dock_bike(Bike.new)
    test_docking_station.dock_bike(Bike.new)
    expect{test_docking_station.dock_bike(Bike.new)}.to raise_error("No available bike storage")
  end
end