class PassengersController < ApplicationController
  before_filter :current_user, :if_not_user_redirect

  def index
    @ride = Ride.where(id: params[:ride_id]).first
    @passengers = @ride.passengers.all
  end

  def show
    @ride = Ride.where(id: params[:ride_id]).first
    @passenger = @ride.passengers.where(id: params[:id]).first
  end

  def create
    @ride = Ride.where(id: params[:ride_id_from_form_for]).first
    @passenger = @ride.passengers.new(user_id: current_user.id, ride_id: @ride.id)
    @message = Message.new(message_text: params[:message_text], from_user: @current_user.id, to_user: @ride.user_id)

    if (@message.save && @passenger.save)
      redirect_to my_ride_path(@current_user, @ride)
    else
      redirect_to rides_path
    end
  end

end
