
class RidesController < ApplicationController

  def index
    if params[:search]
      @rides = Ride.search(params[:search])
    else
      @rides = Ride.all 
    end
    @user = current_user if session[:user_id]
  end

  def show
    @ride = Ride.where(id: params[:id]).first
  end

  def requests
    @rides = Ride.where(driver_id: nil)
  end

  def drives
    @rides = Ride.where("driver_id > 0")
  end

end
