class Dropriderequesttable < ActiveRecord::Migration
  def change
    drop_table :ride_requests
  end
end
