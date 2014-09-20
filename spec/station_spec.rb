require 'station'

describe Station do

	let(:station) {Station.new}

	it "should be able to hold trains" do
		train = double :train
		station.accept(train)
		expect(station).to have_trains
	end

	it "should be able to admit passengers" do
		passenger = double :passenger
		station.admit(passenger)
		expect(station).to have_passengers
	end
	
end