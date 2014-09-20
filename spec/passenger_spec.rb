require 'passenger'
require 'station'

describe Passenger do 

let(:passenger) {Passenger.new}
let(:station) {Station.new}

	it "should be able to enter a station" do
		passenger.enter(station)
		expect(station.passenger_count).to eq(1)
	end

	it "should be able to leave a station" do
		passenger.enter(station)
		expect(station.passenger_count).to eq(1)
		passenger.exit(station)
		expect(station.passenger_count).to eq(0)
	end
	
	it "should be able to board coach" do
		coach = double :coach
		expect(coach).to receive(:pick_up)
		passenger.board(coach)
	end

	it "should be able to get off the coach" do
		coach = double :coach
		expect(coach).to receive(:drop_off)
		passenger.get_off(coach, station)
		expect(station.passenger_count).to eq(1)
	end

end
