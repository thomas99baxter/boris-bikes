class Bike
  def initialize
    @working = true
  end

  def working?
    return @working
  end

  def report_broken_bike
    @working = false
  end
end