
 require 'spec_helper'

describe RidesController do

  describe'GET#show' do
    
    it "assigns the requested ride to @ride" do
      ride = FactoryGirl.create(:ride)
      get :show, id: ride
      expect(assigns(:ride)).to eq ride
    end

    it "renders the :show template" do
      ride = FactoryGirl.create(:ride)
      get :show, id: ride 
      expect(response).to render_template :show
    end 

  end

  describe 'GET#index' do 

    it "assigns all rides to @rides" do
      rides = FactoryGirl.create(:ride)
      get :index
      expect(assigns(:rides)).to eq([rides])
    end

    it "renders the :index template" do 
      get :index
      expect(response).to render_template :index
    end

  end

  describe 'GET#new' do 

    it "assigns a new ride to @ride" do 
      get :new
      expect(assigns(:ride)).to be_a_new(Ride)
    end

    it "renders the :new template" do 
      get :new
      expect(response).to render_template :new
    end

  end

  describe 'POST#Create' do 

    it "saves the ride to the database" do 
      expect{
        post :create, ride: FactoryGirl.attributes_for(:ride)
      }.to change(Ride, :count).by(1)
    end

    it "redirects to :show template" do 
      post :create, ride: FactoryGirl.attributes_for(:ride)
      expect(response).to redirect_to :action => :show, :id => assigns(:ride).id
    end

  end

  describe 'PATCH#Update' do 
    before :each do 
      @ride = FactoryGirl.create(:ride)
    end

    it "updates ride attributes" do 
      patch :update, id: @ride, ride: FactoryGirl.attributes_for(:ride, donation_amt: 100)
      @ride.reload
      expect(@ride.donation_amt).to eq(100)
    end

    it "redirects to :show template" do 
      patch :update, id: @ride, ride: FactoryGirl.attributes_for(:ride)
      expect(response).to redirect_to @ride
    end

  end

  describe 'DELETE#Destroy' do 
    before :each do 
      @ride = FactoryGirl.create(:ride)
    end

    it "deletes the ride" do 
      expect{ delete :destroy, id: @ride }.to change(Ride, :count).by(-1) 
    end

    it "redirects to :index template" do 
      delete :destroy, id: @ride
      expect(response).to redirect_to rides_path      
    end

  end

end
 