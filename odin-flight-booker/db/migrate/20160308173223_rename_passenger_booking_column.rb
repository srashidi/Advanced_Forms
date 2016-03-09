class RenamePassengerBookingColumn < ActiveRecord::Migration
  def change
  	rename_column :bookings, :passengers_booking_id, :passenger_booking_id
  end
end
