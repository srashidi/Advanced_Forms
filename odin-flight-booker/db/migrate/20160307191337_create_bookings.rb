class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :number_of_passengers
      t.integer :passengers_booking_id

      t.timestamps null: false
    end
  end
end
