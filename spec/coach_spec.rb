require 'coach'

describe Coach do

	let(:coach) {Coach.new}
	let(:passenger) {double :passenger}

	def fill_coach(passenger)
		coach.capacity.times {coach.pick_up(passenger)}
	end

	it "should have a capacity of 40 passengers" do
		expect(coach.capacity).to eq(40)
	end

	it "should be able to accept passengers" do
		expect{coach.pick_up(passenger)}.to change{coach.passenger_count}.by(1)
	end

	it "should know when it's full" do
	    fill_coach(passenger)
		expect(coach).to be_full 
	end

	it "should let passengers get off" do
		coach.pick_up(passenger)
		expect{coach.drop_off(passenger)}.to change{coach.passenger_count}.by -1
	end

	it "should not pick up passengers when it's full" do
		fill_coach(passenger)
		expect{coach.pick_up(passenger)}.to raise_error "There's no more room on this coach. Try another coach."
	end
	
end