class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :from
      t.string :to
      t.datetime :ride_date
      t.integer :no_of_seats
      t.integer :no_booked_seats
      t.text :description
      t.integer :donation_amt
      t.boolean :luggage_space
      t.boolean :ski_rack
      t.boolean :bike_rack
      t.integer :user_id

      t.timestamps
    end
  end
end
