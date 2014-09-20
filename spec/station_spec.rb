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
		station.touch_in(passenger)
		expect(station).to have_passengers
	end
	
	it "should know how many passengers are in the station" do
		passenger = double :passenger
		station.touch_in(passenger)
		expect(station.passenger_count).to eq(1)
	end	
	
	it "should be able to let out passengers" do
		passenger = double :passenger
		station.touch_in(passenger)
		expect(station.passenger_count).to eq(1)
		station.touch_out(passenger)
		expect(station.passenger_count).to eq(0)
	end

	it "should be able to release trains" do
		train = double :train
		station.accept(train)
		expect(station.train_count).to eq(1)
		station.release(train)
		expect(station.train_count).to eq(0)
	end
end