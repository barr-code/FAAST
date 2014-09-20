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

	it "should be able to arrive at station" do
		train.arrive(station)
		expect(station.train_count).to eq(1)
	end

	it "should be able to leave the station" do 
		train.arrive(station)
		train.depart(station)
		expect(station.train_count).to eq(0)
	end
	
end