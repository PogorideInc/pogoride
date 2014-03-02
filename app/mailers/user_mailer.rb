class UserMailer < ActionMailer::Base
  default from: "pogoridelhl@gmail.com"

  def welcome_email(new_user)
    @new_user = new_user

    mail(to: @new_user.email, subject: "Welcome to PogoRide, #{@new_user.username}!")
  end

  def new_requested_passenger(new_passenger, ride)
  	@ride = ride
  	@driver = User.where(id: @ride.driver_id).first
  	@new_passenger = new_passenger
  	
  	mail(to: @driver.email, subject: "Some one wants to join the ride.")
  end

  def driver_added(ride, drivers_user_id, passenger_email_array)
    @ride = ride
    @driver = User.where(id: drivers_user_id).first

    mail(to: passenger_email_array, subject: "A Driver has Signed Up for your Ride!")
  end

  def driver_left(ride, drivers_user_id, passenger_email_array)
    @ride = ride
    @driver = User.where(id: drivers_user_id).first

    mail(to: passenger_email_array, subject: "Heads-Up: You're Driver Has Left.")
  end 

  def acceptance_letter

  end

end
