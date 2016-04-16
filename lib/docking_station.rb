require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20
attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def dock(bike)
    raise 'Docking station full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end


end
