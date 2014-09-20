class Train

	def initialize(capacity=10)
		@capacity = capacity
		@coaches = []
	end

	def capacity
		@capacity
	end

	def load(coach)
		@coaches << coach
	end

	def coach_count
		@coaches.count 
	end

	def arrive(station)
		station.accept(self)
	end

	def depart(station)
		station.release(self)
	end
end