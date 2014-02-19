class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_user
      t.integer :to_user
      t.integer :ride_id

      t.timestamps
    end
    add_index :messages, :ride_id
  end
end
