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
    
end
