require "docking-station"
require "bike"
test_docking_station = nil
CAPACITY = 20

describe 'DockingStation' do
  let(:bike) {double :bike}

  before(:each) do 
    test_docking_station = DockingStation.new(CAPACITY)
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

  it "will push a bike to an array when docked and have correct length" do

    result = test_docking_station.get_docked_bikes
    expect(result.length).to eq CAPACITY
  end
  
  it "will push instances of bike to docking station" do
    result = test_docking_station.get_docked_bikes
    result.each do |bike|
      expect(bike.is_a? Bike).to eql true
    end
  end

  it "should not release bikes from empty docking station" do
    test_docking_station.release_multiple_bikes(CAPACITY)
    
    expect{test_docking_station.release_bike}.to raise_error(NoBikeError, "There are no working bikes")
  end

  it "should not allow bikes to be docked to a full docking station" do
    # TODO: stub this Bike.new oot
    expect{test_docking_station.dock_bike(double(:bike))}.to raise_error(DockingStationFullError, "Docking station full!")
  end

  it "should allow bikes to be docked to a partially full docking station" do
    test_docking_station.release_bike
    # TODO: stub this oot
    test_docking_station.dock_bike(double(:bike))
    expect(test_docking_station.get_docked_bikes.length).to eq(CAPACITY)
  end

  it "should release multiple bikes" do
    test_docking_station.release_multiple_bikes(CAPACITY)

    expect(test_docking_station.get_docked_bikes.length).to eq(0)
  end

  it "shouldny release broken bikes" do
    test_docking_station.release_multiple_bikes(CAPACITY - 1)

    bike = test_docking_station.release_bike
    bike.report_broken_bike
    test_docking_station.dock_bike(bike)

    expect{test_docking_station.release_bike}.to raise_error(NoBikeError, "There are no working bikes")

  end

  it "should so something" do
    test_docking_station.release_multiple_bikes(4)

    allow(bike).to receive(:working?).and_return(true)

    test_docking_station.dock_bike(bike)

    released_bike = test_docking_station.release_bike

    expect(released_bike.working?).to eq(true)
  end
end