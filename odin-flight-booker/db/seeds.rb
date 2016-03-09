# Airports
Airport.create!(code: "NYC")
Airport.create!(code: "SFO")

# Flights
50.times do
	Flight.create!(	to_airport_id:		1,
									from_airport_id:	2,
									start_datetime:		Faker::Time.forward(25, :day),
									duration:					6.hours)
end

50.times do
	Flight.create!(	to_airport_id:		2,
									from_airport_id:	1,
									start_datetime:		Faker::Time.forward(25, :day),
									duration:					6.hours)
end