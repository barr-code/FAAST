require 'coach'

describe Coach do

	let(:coach) {Coach.new}
	let(:passenger) {double :passenger}

	it "should have a capacity of 40 passengers" do
		expect(coach.capacity).to eq(40)
	end

	it "should be able to accept passengers" do
		expect{coach.pick_up(passenger)}.to change{coach.passenger_count}.by(1)
	end

	it "should know when it's full" do
		40.times {coach.pick_up(passenger)}
		expect(coach).to be_full 
	end

	it "should let passengers get off" do
		coach.pick_up(passenger)
		expect{coach.drop_off(passenger)}.to change{coach.passenger_count}.by -1
	end

	it "should not pick up passengers when it's full" do
		40.times {coach.pick_up(passenger)}
		expect(lambda {coach.pick_up(passenger)}).to raise_error(RuntimeError)
	end
	
end