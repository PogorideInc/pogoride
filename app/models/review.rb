class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :for_user, class_name: 'User'

  scope :reviews_for, ->(user) { where("for_user = ?", user) }

  validates :user,
    presence: true

  validates :rating,
    numericality: { only_integer: true }
  validates :rating,
    numericality: { greater_than_or_equal_to: 1 }
  validates :rating,
    numericality: { less_than_or_equal_to: 5 }

end
