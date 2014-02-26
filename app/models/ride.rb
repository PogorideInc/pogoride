class Ride < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :user
  has_many :passengers
  has_many :messages

  validates :description, presence: true
  validates :donation_amt, presence:true, numericality: { only_integer:true, greater_than: 0 }
  validate :ride_date_is_in_future

  state_machine initial: :requested do
    state :requested, value: 'q'
    state :driver_assigned, value: 'd'
    state :completed, value: 'm'
    state :cancelled, value: 'c'

    event :driver_assign do
      transition :requested => :driver_assigned
    end

    event :complete do
      transition :driver_assigned => :completed
    end

    event :cancel do 
      transition :requested => :cancelled
    end

    event :driver_unassign do 
      transition :driver_assigned => :requested
    end

  end

  def has_passengers?
    if passengers.present?
      return true
    end
      false
  end

  def passenger_email_array
    passenger_emails = []
    self.passengers.each { |x| passenger_emails << x.user.email }
    passenger_emails
  end

  def self.search(search)
    if search
      where("rides.from ilike ?", "%#{search}%")
    else
      find(:all)
    end  
  end

  protected

  def ride_date_is_in_future
    if ride_date <= Date.today
      errors.add(:ride_date, "Ride date must be in the future")
    end
  end

end
