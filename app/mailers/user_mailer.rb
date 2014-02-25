class UserMailer < ActionMailer::Base
  default from: "pogoridelhl@gmail.com"

  def welcome_email

  end

  def new_requested_passenger(new_passenger, ride)
  	@ride = ride
  	@driver = User.where(id: @ride.driver_id).first
  	@new_passenger = new_passenger
  	
  	mail(to: @driver.email, subject: "Some one wants to join the ride.")
  end


end
