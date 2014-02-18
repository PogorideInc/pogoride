require 'spec_helper'

describe RideRequest do
  
  it { should belong_to(:ride) }
  it { should validate_presence_of(:ride_id) }
  it { should validate_presence_of(:passenger_id) }

end
