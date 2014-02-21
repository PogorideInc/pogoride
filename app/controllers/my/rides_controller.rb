require 'pry'

class My::RidesController < My::MyController
  before_filter :current_user, :if_not_user_redirect

  def index
    @user = @current_user
    @rides = Ride.all
  end

  def show
    @user = @current_user
    @ride = @user.rides.where(id: params[:id]).first
  end

  def new
    @user = User.where(id: @current_user.id).first
    @ride = @user.rides.new
  end

  def create # refactor code in main if/else to Ride model? (create_request(ride, user), create_ride(ride, user))
    @user = current_user
    @ride = @user.rides.new(ride_params)

    if params[:user_is_driver][:user_is_driver] == "1" # So dirty
    
        @ride.driver_id = @user.id
        @ride.driver_assign

        if @ride.save
          redirect_to my_ride_path(@ride)
        else 
          render :new
        end
    else
      @ride.save # Associated saving? 
      @ride.passengers.new(user_id: @user.id)
      @ride.passengers.last.accept

      if @ride.save
        redirect_to my_ride_path(@ride)
      else
        render :new
      end
    end
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def update
    @ride = Ride.find(params[:id])
    if @ride.update_attributes(ride_params)
      redirect_to my_ride_path(@current_user, @ride)
    else
      render :edit
    end
  end

  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy
    redirect_to my_rides_path
  end

  def requests
    #logic needs work
    @user = @current_user
    @rides = @user.rides.where(user_id: @user.id)
  end

  def drives
    @user = @current_user
    @rides = @user.rides.where(driver_id: @user.id)
  end

  def remove_driver
    @ride = Ride.find(params[:format])
    @ride.driver_unassign
    @ride.driver_id = nil
    @ride.save
    redirect_to my_rides_path
  end

  protected

  def ride_params
    params.require(:ride).permit(
      :from, :to, :ride_date, :no_of_seats, :no_booked_seats, :description, :donation_amt, :luggage_space, :ski_rack, :bike_rack, :user_id, :ride_time
    )
  end

end