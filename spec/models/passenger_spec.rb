require 'spec_helper'

describe Passenger do
  
  it { should belong_to(:ride) }
  it { should validate_presence_of(:ride_id) }
  it { should validate_presence_of(:passenger_id) }

end
