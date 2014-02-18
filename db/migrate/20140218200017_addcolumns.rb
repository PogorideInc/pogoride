class Addcolumns < ActiveRecord::Migration
  def change
    add_column :ride_requests, :status_code, :integer, :limit => 1
    add_column :ride_requests, :message_id, :integer
    add_column :ride_requests, :date_modified, :datetime 
  end
end
