require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike}

  it 'releases a working bike' do
    expect(subject.release_bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end


  it 'returns a docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end
