class Garage
  def initialize
    @broken_bikes = []
    @fixed_bikes = []
  end
  # Returns an array of either broken or fixed bikes
  # depending on whether they're going to a docking
  # station, or a garage
  def collect_bikes(bikes)
    return bikes
  end
  def fix_bikes(bikes)
    bikes.each do |bike|
      if !bike.working?
        bike.fix_bike
        @fixed_bikes.push(bike)
      else
        @fixed_bikes.push(bike)
      end
    end
  end
  def get_broken_bikes
    @broken_bikes
  end
  def get_fixed_bikes
    @fixed_bikes
  end
end