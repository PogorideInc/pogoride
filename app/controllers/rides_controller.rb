class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(ride_params)
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def update
    @ride = Ride.find(params[:id])

  end

  def destroy
    @ride = Ride.find(params[:id])
  end

  protected

  def ride_params
    params.require(:Ride).permit(
      :from, :to, :ride_date, :no_of_seats, :no_booked_seats, :description, :donation_amt, :luggage_space, :ski_rack, :bike_rack, :user_id
    )
  end

end
