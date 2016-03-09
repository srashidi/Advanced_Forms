class ChangeBookingAndPassengerForeignIds < ActiveRecord::Migration
  def change
  	add_column :passengers, :booking_id, :integer
  	remove_column :bookings, :passenger_booking_id
  end
end