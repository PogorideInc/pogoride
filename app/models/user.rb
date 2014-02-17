class User < ActiveRecord::Base

	has_secure_password

	validates :username, :email, :password_confirmation, presence: true

end