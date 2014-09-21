require 'passenger'
require 'station'
require 'train'
require 'coach'

describe Passenger do 

let(:passenger) {Passenger.new}
let(:station) {Station.new}
let(:train) {Train.new}
let(:coach) {Coach.new}

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
		train.load(coach)
		train.travel(nil, station)
		passenger.enter(station)
		passenger.board(station, coach)
	end

	it "should only be able to board coaches when passenger is at a station" do
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

	it "should be able to top up credit" do 
		passenger = Passenger.new(0)
		passenger.top_up(50)
		expect(passenger.credit).to eq(50)
	end

	it "should only be able to board a coach if the coach is at the station" do
		passenger.enter(station)
		expect(lambda {passenger.board(station, coach)}).to raise_error(RuntimeError)
	end

end
