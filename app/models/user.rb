class User < ActiveRecord::Base

  has_many :rides
  has_many :passengers

  has_secure_password

  validates :username, :email, :password_confirmation, presence: true

end