class Passenger < ActiveRecord::Base
  belongs_to :user
  belongs_to :ride

  validates :user_id, :ride_id, presence: true

  state_machine initial: :requested do
    state :requested, value: "Q"
    state :accepted, value: "A"
    state :rejected, value: "J"
    state :cancelled, value: "C"
    state :paid, value: "P"

    event :reject do
      transition :requested => :rejected
    end

    event :accept do
      transition :requested => :accepted
    end

    event :cancel do
      transition :requested => :cancelled, :accepted => :cancelled
    end

    event :acceptance_revoke do
      transition :accepted => :rejected
    end

    event :pay do
      transition :accepted => :paid
    end
  end



end
