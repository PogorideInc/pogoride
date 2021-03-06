class User < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "logo.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :rides
  has_many :passengers
  has_many :reviews

  has_secure_password

  validates :username, :email, :password_confirmation, presence: true

end
