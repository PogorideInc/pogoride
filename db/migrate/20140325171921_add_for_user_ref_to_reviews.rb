class AddForUserRefToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :for_user, index: true
  end
end
