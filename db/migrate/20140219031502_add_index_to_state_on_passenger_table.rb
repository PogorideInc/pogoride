class AddIndexToStateOnPassengerTable < ActiveRecord::Migration
  def change
  	add_index :passengers, :state
  end
end
