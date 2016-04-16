require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  it_behaves_like BikeContainer

  let(:working_bike) { double(:bike, broken?: false) }
  let(:broken_bike)  { double(:bike, broken?: true) }


  describe '#release_bike' do
    it 'releases a working bike' do
      subject.dock(working_bike)
      expect(subject.release_bike).to be working_bike
    end
     it 'does not release a broken bike' do
       subject.dock(broken_bike)
       expect { subject.release_bike }.to raise_error 'No bikes available'
     end
  end
end
