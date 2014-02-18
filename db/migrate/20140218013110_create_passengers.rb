class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.integer :ride_id
      t.integer :passenger_id

      t.timestamps
    end
  end
end
