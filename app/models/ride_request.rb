class RideRequest < ActiveRecord::Base

  belongs_to :ride

  validates :ride_id, presence: true
  validates :passenger_id, presence: true

end
