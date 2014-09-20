class Passenger

	def enter(station)
		station.touch_in(self)
	end

	def exit(station)
		station.touch_out(self)
	end

end