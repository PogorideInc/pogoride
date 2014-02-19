require 'spec_helper'

describe Ride do
  
  it "has a valid factory" do 
    FactoryGirl.create(:ride).should be_valid
  end

  it "is valid with description and donation amount" do 
    ride = FactoryGirl.build(:ride)
    expect(ride).to be_valid
  end

  it "is invalid without a description" do
    ride = FactoryGirl.build(:ride, description: nil)
    expect(ride).to have(1).errors_on(:description)
  end

  it "is invalid without a donation amount" do 
    ride = FactoryGirl.build(:ride, donation_amt: nil)
    expect(ride).to have(2).errors_on(:donation_amt)
  end

  it "is invalid with donation of $0" do 
    ride = FactoryGirl.build(:ride, donation_amt: 0)
    expect(ride).to have(1).errors_on(:donation_amt)
  end
    
  it "date must be in the future" do
    ride = FactoryGirl.build(:ride, ride_date: Date.today)
    expect(ride).to have(1).errors_on(:ride_date)
  end

  context "states" do

    before :each do 
      @ride = create(:ride)
    end

    it "state gets assigned" do 
      @ride.should be_requested
    end

    it "should change to driver assigned on driver_assign" do 
      @ride.driver_assign
      @ride.should be_driver_assigned
    end

    it "should change from driver_assigned to completed on complete call" do 
      @ride.driver_assign
      @ride.complete
      @ride.should be_completed
    end

    it "should change to requested on driver_unassign" do 
      @ride.driver_assign
      @ride.driver_unassign
      @ride.should be_requested
    end

    it "should change from requested to cancelled on cancel call" do 
      @ride.cancel
      @ride.should be_cancelled
    end

    it "should NOT cancel ride that's driver_assigned" do 
      @ride.driver_assign
      @ride.cancel
      @ride.should be_driver_assigned
    end

    it "should NOT change from completed to cancelled" do 
      @ride.state = 'm'
      @ride.cancel
      @ride.should be_completed
    end

    it "should NOT change from cancelled to completed" do 
      @ride.state = 'c'
      @ride.complete
      @ride.should be_cancelled
    end

  end
end
