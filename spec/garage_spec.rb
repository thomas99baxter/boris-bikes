require "garage"
require "bike-generator"
require "van"
describe Garage do
  before(:each) do
    @test_garage = Garage.new
  end
  it "should fix broken bikes" do
    bikes = []
    3.times do
      bikes.push(Bike.new)
    end
    bikes.each do |bike|
      bike.report_broken_bike
    end
    @test_garage.fix_bikes(bikes)
    fixed_bikes = @test_garage.get_fixed_bikes
    fixed_bikes.each do |bike|
      expect(bike.working?).to eq(true)
    end
  end
  it  "can take in a bike from a van" do
    bikes = []
    3.times do
      bikes.push(Bike.new)
    end
    van = Van.new
    van.collect_bikes(bikes)
    @test_garage.collect_bikes(van.deliver_bikes(van.get_fixed_bikes))
    fixed_bikes = @test_garage.get_fixed_bikes
    fixed_bikes.each do |bike|
      expect(bike.working?).to eq(true)
    end
  end
end