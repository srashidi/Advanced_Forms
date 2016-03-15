class PassengerMailer < ApplicationMailer
	default from: 'notifications@odin.com'

	def thank_you_email(passenger)
		@passenger = passenger
		@booking = passenger.booking
		@url = "localhost:3000/bookings/#{@booking.id}"
		mail(to: @passenger.email, subject: "Thank you for booking your flight!")
	end
end
