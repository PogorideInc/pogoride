class UserMailer < ActionMailer::Base
  default from: "pogoridelhl@gmail.com"

  def welcome_email

  end

  def new_requested_passenger(driver, new_passenger, ride)
  	@driver = driver
  	@new_passenger = new_passenger
  	@ride = ride
  	mail(to: @driver.email, subject: "#{@new_passenger.username} wants to join your ride from #{@ride.from} to #{@ride.to}.")
  end


end
