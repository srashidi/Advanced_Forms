class Flight < ActiveRecord::Base
	belongs_to :to_airport,		class_name: "Airport"
	belongs_to :from_airport,	class_name: "Airport"
	has_many :bookings,				dependent: :destroy
end
