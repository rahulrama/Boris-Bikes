require_relative 'bike_container'

class Van
  include BikeContainer

  def collect(bike)
    accept bike
  end

  def deliver(bike)
    release
  end

end
