class Ride < ActiveRecord::Base

  belongs_to :user

  validates :description, presence: true
  validates :donation_amt, presence:true, numericality: { only_integer:true, greater_than: 0 }
  validate :ride_date_is_in_future

  protected

  def ride_date_is_in_future
    if ride_date <= Date.today
      errors.add(:ride_date, "Ride date must be in the future")
    end
  end

end
