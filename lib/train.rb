class Train

	def initialize(capacity=10)
		@capacity = capacity
	end

	def capacity
		@capacity
	end

	def arrive(station)
		station.accept(self)
	end

	def depart(station)
		station.release(self)
	end
end