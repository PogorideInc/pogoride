class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.string :author

      t.timestamps
    end
  end
end
