require "van"
require "bike-generator"

describe "Van" do
  before(:each) do
    @test_van = Van.new
  end

  it "should return an array of bikes when delivering bikes" do
    bikes = ["bike", "bike2", "bike3"]

    expect(@test_van.deliver_bikes(bikes)).to eq(bikes)
  end

  it "should collect broken bikes" do
    test_broken_bikes = []

    3.times do test_broken_bikes.push(Bike.new) end

    test_broken_bikes.each do |bike|
      bike.report_broken_bike
    end

    @test_van.collect_bikes(test_broken_bikes)

    van_broken_bikes = @test_van.get_broken_bikes

    van_broken_bikes.each do |bike|
      expect(bike.is_a? Bike).to eq true
      expect(bike.working?).to eq false
    end
  end
end