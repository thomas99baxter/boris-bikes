require "bike-generator"

class NoBikeError < StandardError
  def initialize(msg="There are no working bikes")
    super
  end
end

class DockingStationFullError < StandardError
  def initialize(msg="Docking station full!")
    super
  end
end

class DockingStation
  attr_reader :bike

  def initialize(capacity = 20)
    @docked_bikes = []
    @bike = bike
    @total_bikes = capacity
    @working_bikes = []
    populate_dock()
  end
  
  def populate_dock
    @total_bikes.times do 
      @docked_bikes.push Bike.new
    end
  end

  def get_working_bikes(docked_bikes)
    @working_bikes = docked_bikes.select do |bike|
       bike.working? == true
    end
  end

  def release_bike 
    get_working_bikes(@docked_bikes)
      if !empty?(@working_bikes)
      
      bike = @working_bikes.last
      @working_bikes.pop
      @docked_bikes.delete(bike)

      return bike
    else 
      raise NoBikeError.new()
    end 
  end

  def release_multiple_bikes(amount)
    amount.times do release_bike end
  end

  def dock_bike(bike)
    if full?(@docked_bikes, @total_bikes)
      raise DockingStationFullError.new()
    else
      @docked_bikes.push(bike)  
    end
  end

  def get_docked_bikes
    return @docked_bikes unless @docked_bikes.length == 0
  end

  private

  def empty?(arr) 
    arr.length == 0 ? true : false
  end

  def full?(arr, max_len)
    arr.length >= max_len ? true : false
  end
end
