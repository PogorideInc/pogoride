require 'spec_helper'

describe Message do
  
  let!(:ride) { create(:ride) }
  let!(:message) { create(:message, ride_id: ride.id) }

  context "validations" do 
    it { should validate_presence_of(:from_user) }
    it { should validate_presence_of(:to_user) }
    it { should validate_presence_of(:message_text) }
  end

  it "has a valid factory" do 
    expect(create(:message)).to be_valid
  end

end
