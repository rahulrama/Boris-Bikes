require 'garage'
require 'support/shared_examples_for_bike_container'

describe Garage do
  it_behaves_like BikeContainer
  let (:bike) { double :bike}

  it 'fixes broken bikes' do
    subject.accept bike
    expect(bike).to receive :fix
    subject.fix_bikes
  end

  # it 'accepts only broken_bikes' do
  #   bike = double(:bike, broken?: false)
  #   expect { subject.receive(bike) }.to raise_error 'Bike not broken'
  # end
end
