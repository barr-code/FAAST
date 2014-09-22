require 'train'

describe Train do

	let(:train) {Train.new}
	let(:station) {double :station}
	let(:coach) {double :coach}

	it "should be have a default capacity of 10 coaches" do
		expect(train.capacity).to eq(10)
	end

	it "should transfer coaches" do
		train.load(coach)
		expect(train.coach_count).to eq(1)
	end

	it "should be able to arrive at station" do
		expect(station).to receive(:accept)
		train.load(coach)
		train.travel(nil, station)
	end

	it "should move from one station to another" do 
		station1, station2 = Station.new, Station.new
		train.load(coach)
		train.travel(nil, station1)
		expect{train.travel(station1, station2)}.to change{station1.train_count}.by(-1)
		expect{train.travel(station1, station2)}.to change{station2.train_count}.by(1)
	end

	it "should not transfer more coaches that its capacity" do
		10.times {train.load(coach)}
		expect(lambda {train.load(coach)}).to raise_error(RuntimeError)
	end

	it "should not travel between stations without a coach" do
		expect(lambda {train.travel(nil, station)}).to raise_error(RuntimeError)
	end
	
end