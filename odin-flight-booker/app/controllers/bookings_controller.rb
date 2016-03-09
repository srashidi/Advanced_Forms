class BookingsController < ApplicationController

  def new
  	if request.original_url.include?("?")
			flight_pos = request.original_url.index("flight_id") + 13
			i = 0
			i += 1 while request.original_url[flight_pos+i] =~ /\d/
			i -= 1
			flight_id = request.original_url[flight_pos..flight_pos+i]
			@flight = Flight.find(flight_id)
			pass_pos = request.original_url.index("num_of_pass") + 15
			@num_of_pass = request.original_url[pass_pos].to_i
		end
		@booking = Booking.new
		@passenger = Passenger.new
		@num_of_pass.times { @booking.passengers.build }
  end

  def create
  	@booking = Booking.new(booking_params)
  	if @booking.save
  		render :show
  	else
  		render :new
  	end
  end

  def show
  	@booking = Booking.find(params[:id])
  	@flight = @booking.flight
  	@passengers = @booking.passengers
  end

  private

  	def booking_params
  		params.require(:booking).permit(:flight_id, :number_of_passengers,
  																		passengers_attributes: [:id, :name, :email])
  	end
end
