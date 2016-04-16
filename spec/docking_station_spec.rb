require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it 'has a variable capacity' do
      station = DockingStation.new(50)
      50.times { station.dock Bike.new }
      expect { station.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

    describe '#dock' do
      it 'raises an error when full' do
        subject.capacity.times { subject.dock(Bike.new) }
        expect { subject.dock Bike.new }.to raise_error 'Docking station full'
      end
    end

end
