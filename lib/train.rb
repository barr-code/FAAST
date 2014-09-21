require_relative 'coach.rb'

class Train

	def initialize(capacity=10)
		@capacity = capacity
		@coaches = []
	end

	def capacity
		@capacity
	end

	def load(coach)
		raise 'Can\'t transfer another coach. Try another train.' if full?
		@coaches << coach
	end

	def coach_count
		@coaches.count 
	end

	def transfer(station_from=nil, station_to)
		station_from.release(self) if station_from != nil
		station_to.accept(self)
	end

	def full?
		coach_count == @capacity
	end

end