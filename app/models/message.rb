class Message < ActiveRecord::Base

  belongs_to :ride

  validates :from_user, presence: true
  validates :to_user, presence: true
  validates :message_text, presence: true


end
