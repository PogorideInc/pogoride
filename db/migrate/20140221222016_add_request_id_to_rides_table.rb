class AddRequestIdToRidesTable < ActiveRecord::Migration
  def change
    add_column :rides, :request_id, :integer
  end
end
