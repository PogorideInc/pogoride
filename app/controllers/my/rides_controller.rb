class My::RidesController < My::MyController
  before_filter :current_user, :if_not_user_redirect

  def index
    @user = @current_user
    @rides = @user.rides.where(driver_id: @user.id)
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
    @ride = @current_user.rides.new(ride_params)
    if @ride.save
      redirect_to my_ride_path(@ride)
    else
      render :new
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

  protected

  def ride_params
    params.require(:ride).permit(
      :from, :to, :ride_date, :no_of_seats, :no_booked_seats, :description, :donation_amt, :luggage_space, :ski_rack, :bike_rack, :user_id
    )
  end

end