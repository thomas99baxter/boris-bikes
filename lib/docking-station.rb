 require "bike"

class DockingStation
  attr_reader :bike

  def initialize(bike)
    @docked_bikes = []
    @bike = bike
    @current_bikes = 3
    @bike_capacity = 5
  end
  
  def release_bike 
    if @current_bikes > 0 
      @current_bikes -= 1
      return @bike
    else 
      raise "No bikes in storage"
    end 
  end

  def dock_bike(bike)
    if @current_bikes < @bike_capacity 
      @docked_bikes.push(bike)
      @current_bikes += 1
      return bike
    else
      raise "No available bike storage"
    end
  end

  def get_docked_bikes
    return @docked_bikes unless @docked_bikes.length == 0
  end
end