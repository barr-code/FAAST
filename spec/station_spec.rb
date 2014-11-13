require 'station'

describe Station do

	let(:station) {Station.new}
	let(:passenger) {double :Passenger}
	let(:train) {double :Train}

	it "should be able to hold trains" do
		station.accept(train)
		expect(station).to have_trains
	end

	it "should be able to admit passengers" do
		station.touch_in(passenger)
		expect(station).to have_passengers
	end
	
	it "should know how many passengers are in the station" do
		station.touch_in(passenger)
		expect(station.passenger_count).to eq(1)
	end	
	
	it "should be able to let out passengers" do
		station.touch_in(passenger)
		expect{station.touch_out(passenger)}.to change{station.passenger_count}.by(-1)
	end

	it "should be able to release trains" do
		station.accept(train)
		expect{station.release(train)}.to change{station.train_count}.by(-1)
	end

	it "should know how many trains are in the station" do
		3.times {station.accept(train)}
		expect(station.train_count).to eq(3)
	end
end