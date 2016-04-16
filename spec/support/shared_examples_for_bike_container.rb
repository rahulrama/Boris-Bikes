shared_examples_for BikeContainer do
  let(:bike) { double(:bike) }

  describe 'capacity' do
    it 'can have a variable capacity when initialised' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
    it 'has a default capacity unless specified' do
      expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end
  end

  describe '#accept' do
    it 'accepts a bike' do
      subject.accept bike
      expect(subject).not_to be_empty
    end
    it 'raises an error when full' do
      subject.capacity.times {subject.accept bike}
      expect { subject.accept bike }.to raise_error "#{described_class.name} full"
    end
  end

  describe '#release_bike' do
    before(:each) { subject.accept bike }

    it 'releases a bike' do
      expect(subject.release).to eq bike
    end
    it 'updates the quantity of bikes left after release' do
      subject.release
      expect(subject).to be_empty
    end
    it 'raises an error when empty' do
      subject.release
      expect { subject.release }.to raise_error "#{described_class} empty"
    end
  end

end
