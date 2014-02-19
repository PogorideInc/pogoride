class AddStateToRidesTable < ActiveRecord::Migration
  def change
    add_column :rides, :state, :integer
  end
end
