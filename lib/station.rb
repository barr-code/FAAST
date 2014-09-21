class Station

	def initialize
		@trains = []
		@passengers = []
	end

	def has_trains?
		@trains.count != 0
	end

	def has_passengers?
		passenger_count != 0
	end

	def accept(train)
		@trains << train
	end

	def release(train)
		@trains.delete(train)
	end

	def touch_in(passenger)
		@passengers << passenger
	end

	def touch_out(passenger)
		@passengers.delete(passenger)
	end

	def passenger_count
		@passengers.count
	end

	def train_count
		@trains.count
	end

end