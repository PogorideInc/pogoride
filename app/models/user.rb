class User < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "logo.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :rides
  has_many :passengers

  has_secure_password

  validates :username, :email, :password_confirmation, presence: true

  def self.find_for_facebook_oauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end


end