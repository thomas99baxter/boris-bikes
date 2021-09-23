class Van
  def initialize
    @broken_bikes = []
    @fixed_bikes = []
  end

  # Returns an array of either broken or fixed bikes
  # depending on whether they're going to a docking 
  # station, or a garage
  def deliver_bikes(bikes)
    return bikes
  end

  def collect_bikes(bikes)

    bikes.each do |bike|
      bike.working? == true ? @fixed_bikes.push(bike) : @broken_bikes.push(bike)
    end
  end

  def get_broken_bikes
    @broken_bikes    
  end

  def get_fixed_bikes
    @fixed_bikes
  end
end