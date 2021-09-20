require "bike"

class DockingStation
  attr_reader :at
  
  def initialize(at:)
    @docked_bikes = []
  end
  
  def release_bike 
    bike = Bike.new
    return bike 
  end

  def dock_bike(bike)
    @docked_bikes.push(bike)
  end

  def get_docked_bikes
    return @docked_bikes
  end
end