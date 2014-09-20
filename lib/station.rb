class Station

	def initialize
		@trains = []
		@passengers = []
	end

	def has_trains?
		@trains.count != 0
	end

	def has_passengers?
		@passengers.count != 0
	end

	def accept(train)
		@trains << train
	end

	def admit(passenger)
		@passengers << passenger
	end

end