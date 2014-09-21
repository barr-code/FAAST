class Passenger

	attr_accessor :credit

	def initialize(credit=20)
		@in_station = false
		@credit = credit
	end

	def pay_fare
		@credit = @credit - 2
	end
	
	def enter(station)
		raise 'You do not have enough credit on your card. Please top up your card to ride.' if @credit < 2
		station.touch_in(self)
		@in_station = true
		pay_fare
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

	def credit
		@credit
	end
end