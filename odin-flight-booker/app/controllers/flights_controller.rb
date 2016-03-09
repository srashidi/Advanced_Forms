class FlightsController < ApplicationController

  def index
  	@airport_options = Airport.all.map{ |a| a.code }
  	@flights = Flight.all
  	@number_of_passengers = [1,2,3,4]
  	@dates = []
  	Flight.all.each do |flight|
  		unless @dates.include?(flight_date = flight.start_datetime.strftime("%m/%d/%Y"))
				@dates << flight_date
			end
			@dates.sort!
  	end
  	@booking = Booking.new
  	if request.original_url.include?("?")
			from_pos = request.original_url.index("from_code") + 13
			from_code = request.original_url[from_pos..from_pos+2]
			@from_airport = Airport.find_by(code: from_code)
			to_pos = request.original_url.index("to_code") + 11
			to_code = request.original_url[to_pos..to_pos+2]
			@to_airport = Airport.find_by(code: to_code)
			pass_pos = request.original_url.index("num_of_pass") + 15
			@num_of_pass = request.original_url[pass_pos].to_i
			month_pos = request.original_url.index("date") + 8
			month = request.original_url[month_pos..month_pos+1].to_i
			day = request.original_url[month_pos+5..month_pos+6].to_i
			year = request.original_url[month_pos+10..month_pos+13].to_i
			@date = DateTime.new(year, month, day)
			@selected_flights = []
		end
  end
end
