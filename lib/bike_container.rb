module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def accept(bike)
    raise "#{self.class.name} full" if full?
    bikes << bike
  end

  def release
    raise "#{self.class.name} empty" if empty?
    bikes.pop
  end

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

  private

  attr_reader :bikes

end
