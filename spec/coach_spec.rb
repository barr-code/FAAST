require 'coach'
require 'passenger'

describe Coach do

	let(:coach) {Coach.new}
	let(:passenger) {Passenger.new}

	it "should have a capacity of 40 passengers" do
		expect(coach.capacity).to eq(40)
	end

	it "should be able to accept passengers" do
		coach.pick_up(passenger)
		expect(coach.passenger_count).to eq(1)
	end

	it "should know when it's full" do
		40.times {coach.pick_up(passenger)}
		expect(coach).to be_full 
	end

	it "should let passengers get off" do
		coach.pick_up(passenger)
		expect(coach.passenger_count).to eq(1)
		coach.drop_off(passenger)
		expect(coach.passenger_count).to eq(0)
	end

	it "should not pick up passengers when it's full" do
		40.times {coach.pick_up(passenger)}
		expect(lambda {coach.pick_up(passenger)}).to raise_error(RuntimeError)
	end
	
end