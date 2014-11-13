class Coach

	def initialize(capacity=40)
		@capacity = capacity
		@passengers = []
	end

	def capacity
		@capacity
	end

	def pick_up(passenger)
		raise 'There\'s no more room on this coach. Try another coach.' if full?
		@passengers << passenger
	end

	def drop_off(passenger)
		@passengers.delete(passenger)
	end

	def passenger_count
		@passengers.count
	end

	def full?
		passenger_count == @capacity
	end

end