class Station

	attr_reader :passengers, :trains

	def initialize
		@trains, @passengers = [], []
	end

	def has_trains?
		trains.any?
	end

	def has_passengers?
		passengers.any?
	end

	def accept(train)
		trains << train
	end

	def release(train)
		trains.delete(train)
	end

	def touch_in(passenger)
		passengers << passenger
	end

	def touch_out(passenger)
		passengers.delete(passenger)
	end

	def passenger_count
		passengers.count
	end

	def train_count
		trains.count
	end

end