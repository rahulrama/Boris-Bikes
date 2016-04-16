require 'docking_station'

describe DockingStation do

  let(:working_bike) { double(:bike, broken?: false) }
  let(:broken_bike)  { double(:bike, broken?: true) }

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it 'has a variable capacity' do
      station = DockingStation.new(50)
      50.times { station.dock double (:bike) }
      expect { station.dock double (:bike) }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'releases a working bike' do
      subject.dock(working_bike)
      expect(subject.release_bike).to be working_bike
    end
    #  it 'does not release a broken bike' do
    #    subject.dock(broken_bike)
    #    expect(subject.release_bike).to eq bike raise_error 'No bikes available'
    #  end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

    describe '#dock' do
      it 'raises an error when full' do
        subject.capacity.times { subject.dock(double (:bike)) }
        expect { subject.dock double (:bike) }.to raise_error 'Docking station full'
      end
    end

end
