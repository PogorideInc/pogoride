
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

  def create
    @user = current_user
    @ride = @user.rides.new(ride_params)
    is_driver = (params[:user_is_driver] == "1")

    if is_driver

        @ride.driver_id = @user.id
        @ride.driver_assign

        if @ride.save
          redirect_to my_ride_path(@ride)
        else 
          render :new
        end
    else
      @ride.save
      @ride.request_id = @user.id
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
    @user = @current_user
    @rides = @user.rides.where(request_id: @user.id)
  end

  def drives
    @user = @current_user
    @rides = @user.rides.where(driver_id: @user.id)
  end

  def remove_driver
    @ride = Ride.find(params[:id])
    @ride.driver_unassign
    @ride.driver_id = nil
    @ride.save
    redirect_to my_rides_path
  end

  def add_me_to_ride
    @user = @current_user
    @ride = Ride.where(id: params[:id]).first
    @passenger = @ride.passengers.new(user_id: @user.id)
    if @passenger.save
      UserMailer.new_requested_passenger(@user, @ride).deliver
      redirect_to my_rides_path
    else
      flash[:notice] = "Oooops - something went wrong - couldn't add you to ride"
      redirect_to my_rides_path
    end
  end

  protected

  def ride_params
    params.require(:ride).permit(
      :from, :to, :ride_date, :no_of_seats, :no_booked_seats, :description, :donation_amt, :luggage_space, :ski_rack, :bike_rack, :user_id, :ride_time
    )
  end

end