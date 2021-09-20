# require "./bike"

class DockingStation
  attr_reader :bike

  def initialize(bike)
    @docked_bikes = []
    @bike = bike
    @max_bikes = 3
  end
  
  def release_bike 
    p @max_bikes
    if @max_bikes > 0 
      @bike = "goose"
      @max_bikes -= 1
      p @max_bikes
      return @bike
    else 
      raise "AIOFHAOISFHOIAHSOIHO"
    end 
  end

  def dock_bike(bike)
    @docked_bikes.push(bike)
  end

  def get_docked_bikes
    return @docked_bikes
  end
end

dock = DockingStation.new("meow")
dock.release_bike