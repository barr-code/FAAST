require 'passenger'

describe Passenger do 

let(:passenger) {Passenger.new}
let(:poor_passenger) {Passenger.new(0)}
let(:station) {double :station, :has_trains? => true}
let(:train) {double :train}
let(:coach) {double :coach}

	it "should be able to enter a station" do
		expect(station).to receive(:touch_in)
		passenger.enter(station)
	end

	it "should be able to leave a station" do
		allow(station).to receive(:touch_in)
		expect(station).to receive(:touch_out)
		passenger.enter(station)
		passenger.exit(station)
	end
	
	it "should be able to board coach" do
		allow(station).to receive(:touch_in)
		allow(station).to receive(:touch_out)
		expect(coach).to receive(:pick_up)
		passenger.enter(station)
		passenger.board(station, coach)
	end

	it "should only be able to board coaches when passenger is at a station" do
		allow(coach).to receive(:pick_up)
		expect(lambda {passenger.board(station, coach)}).to raise_error(RuntimeError)
	end

	it "should be able to get off the coach" do
		expect(station).to receive(:touch_in)
		allow(coach).to receive(:drop_off)
		passenger.get_off(coach, station)
	end

	it "should start off with 20 GBP credit" do
		expect(passenger.credit).to eq(20)
	end

	it "should pay 2 GBP to ride the tube" do
		allow(station).to receive(:touch_in)
		expect{passenger.enter(station)}.to change{passenger.credit}.by(-2)
	end

	it "should not be able to ride without enough credit" do 
		expect(lambda {poor_passenger.enter(station)}).to raise_error(RuntimeError)
	end

	it "should be able to top up credit" do 
		passenger.top_up(50)
		expect(passenger.credit).to eq(70)
	end

end
