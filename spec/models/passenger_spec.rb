require 'spec_helper'

describe Passenger do
  before :each do
    @pass = create(:passenger)
  end


  it "has a valid factory" do
    expect(@pass).to be_valid
  end

  describe "state_machine" do

    it 'starts with an initial state of requested.' do
      expect(@pass).to be_requested
    end

    context "allowances" do

      it 'changes the state from requested to accepted with accept event.' do
        @pass.accept
        expect(@pass).to be_accepted
      end

      it 'changes the state from requested to rejected with reject event.' do
        @pass.reject
        expect(@pass).to be_rejected
      end

      it 'changes the state from accepted to cancelled with the cancel event.' do
        @pass.accept
        @pass.cancel
        expect(@pass).to be_cancelled
      end

      it 'changes the state from accepted to rejected with the acceptance_revoke event.' do
        @pass.accept
        @pass.acceptance_revoke
        expect(@pass).to be_rejected
      end    

      it 'changes the state from accepted to paid with the pay event.' do
        @pass.accept
        @pass.pay
        expect(@pass).to be_paid
      end
    end

    context "restrictions" do
      
      it 'will not change the state from requested to paid with the pay event' do
        expect(@pass.pay).to be_false
      end

      it 'will not change the state from cancelled to paid with the pay event' do
        @pass.cancel
        expect(@pass.pay).to be_false
      end

      it 'will not change the state from rejected to paid with the pay event' do
        @pass.reject
        expect(@pass.pay).to be_false
      end
    end
  end
end
