class Station

	def initialize
		@trains = []
	end

	def has_trains?
		@trains.length != 0
	end

	def accept(train)
		@trains << train
	end

end