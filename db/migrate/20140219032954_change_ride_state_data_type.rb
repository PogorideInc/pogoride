class ChangeRideStateDataType < ActiveRecord::Migration
  def change
    change_column :rides, :state, :string
  end
end
