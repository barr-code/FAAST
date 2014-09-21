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
		passenger.enter(station)
		passenger.board(station, coach)
	end

	it "should only be able to board coaches when it's at a station" do
		coach = double :coach
		allow(coach).to receive(:pick_up)
		expect(lambda {passenger.board(station, coach)}).to raise_error(RuntimeError)
	end

	it "should be able to get off the coach" do
		coach = double :coach
		expect(coach).to receive(:drop_off)
		passenger.get_off(coach, station)
		expect(station.passenger_count).to eq(1)
	end

	it "should start off with 20 GBP credit" do
		expect(passenger.credit).to eq(20)
	end

	it "should pay 2 GBP to ride the tube" do
		passenger.enter(station)
		expect(passenger.credit).to eq(18)
		passenger.exit(station)
		passenger.enter(station)
		expect(passenger.credit).to eq(16)
	end

	it "should not be able to ride without enough credit" do 
		passenger = Passenger.new(0)
		expect(passenger.credit).to eq(0)
		expect(lambda {passenger.enter(station)}).to raise_error(RuntimeError)
	end

end
