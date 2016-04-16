require_relative 'bike_container'
require_relative 'bike'

class Garage
  include BikeContainer

  def fix_bikes
    bikes.each { |bike| bike.fix }
  end

  def receive(bike)
    accept bike
  end

  def despatch
    release
  end

end
