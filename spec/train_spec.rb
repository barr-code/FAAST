require 'train'
require 'station'
require 'coach'

describe Train do

	let(:train) {Train.new}
	let(:station) {Station.new}
	let(:coach) {Coach.new}

	it "should be have a default capacity of 10 coaches" do
		expect(train.capacity).to eq(10)
	end

	it "should transfer coaches" do
		train.load(coach)
		expect(train.coach_count).to eq(1)
	end

	it "should be able to arrive at station" do
		train.travel(nil, station)
		expect(station.train_count).to eq(1)
	end

	it "should move from one station to another" do 
		station1, station2 = Station.new, Station.new
		train.travel(nil, station1)
		expect(station2.train_count).to eq(0)
		expect(station1.train_count).to eq(1)
		train.travel(station1, station2)
		expect(station1.train_count).to eq(0)
		expect(station2.train_count).to eq(1)
	end

	it "should not transfer more coaches that its capacity" do
		10.times {train.load(coach)}
		expect(lambda {train.load(coach)}).to raise_error(RuntimeError)
	end
	
end