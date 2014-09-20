class Passenger

	def enter(station)
		station.touch_in(self)
	end

	def exit(station)
		station.touch_out(self)
	end

	def board(coach)
		coach.pick_up(self)
	end

	def get_off(coach, station)
		coach.drop_off(self)
		enter(station)		
	end

end