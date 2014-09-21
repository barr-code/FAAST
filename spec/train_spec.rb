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
		train.arrive(station)
		expect(station.train_count).to eq(1)
	end

	it "should be able to leave the station" do 
		train.arrive(station)
		train.depart(station)
		expect(station.train_count).to eq(0)
	end

	it "should not transfer more coaches that its capacity" do
		10.times {train.load(coach)}
		expect(lambda {train.load(coach)}).to raise_error(RuntimeError)
	end
	
end