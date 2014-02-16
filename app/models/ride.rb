class Ride < ActiveRecord::Base

  belongs_to: user

  validates :description, presence: true
  validates :donation_amt, presence:true, numericality: { only_integer:true, :greater_than: 0 }

end
