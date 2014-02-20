class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.where(id: params[:id]).first
  end

  def requests
    @rides = Ride.where(driver_id: nil)
  end

end
