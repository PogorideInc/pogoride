class AddIndexToStateOnRides < ActiveRecord::Migration
  def change
    add_index :rides, :state
  end
end
