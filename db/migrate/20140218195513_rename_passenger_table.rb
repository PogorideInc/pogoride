class RenamePassengerTable < ActiveRecord::Migration
  def change
    rename_table :passengers, :ride_requests
  end
end
