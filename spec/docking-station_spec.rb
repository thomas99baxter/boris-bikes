require "docking-station"
test_docking_station = nil

describe 'DockingStation' do
  before(:each) do 
    test_docking_station = DockingStation.new("my_bike")
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
    test_docking_station.dock_bike(test_docking_station.release_bike)
    test_docking_station.dock_bike(test_docking_station.release_bike)
    test_docking_station.dock_bike(test_docking_station.release_bike)
    result = test_docking_station.get_docked_bikes
    result.each do |bike|
      expect(bike.is_a? Bike).to eq true
    end
  end
  it "error testing" do
    expect{4 / 0}.to raise_error(ZeroDivisionError)
  end
end