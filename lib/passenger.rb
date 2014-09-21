class Passenger

	def initialize
		@in_station = false
	end

	def enter(station)
		station.touch_in(self)
		@in_station = true
	end

	def exit(station)
		station.touch_out(self)
	end

	def board(station, coach)
		raise 'Must be in the station to board a coach.' if @in_station == false
		exit(station)
		coach.pick_up(self)
	end

	def get_off(coach, station)
		coach.drop_off(self)
		enter(station)		
	end
end