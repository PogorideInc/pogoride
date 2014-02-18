class StaticController < ApplicationController
  def index
  end

  def rides_index
  	@rides = Ride.all
  end

end
