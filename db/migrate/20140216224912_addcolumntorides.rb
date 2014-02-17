class Addcolumntorides < ActiveRecord::Migration
  def change
    change_column :rides, :ride_date, :date
    add_column :rides, :ride_time, :time
  end
end
