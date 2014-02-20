require 'spec_helper'


describe My::RidesController do
  let!(:user) { create(:user) }

  before :each do
    session[:user_id] = user.id
  end

  describe'GET#show' do
    let!(:user) { create(:user) }
    let!(:ride) { create(:ride, user_id: user.id) }

    it "assigns the requested ride to @ride" do
      get :show, id: ride.id, user_id: user.id
      expect(assigns(:ride)).to eq ride
    end

    it "renders the :show template" do
      get :show, id: ride.id, user_id: user.id
      expect(response).to render_template :show
    end 

  end

  describe 'GET#index' do 

    it "assigns all rides to @rides" do
      rides = create(:ride)
      get :index, user_id: user.id
      expect(assigns(:rides)).to match_array([rides])
    end

    it "renders the :index template" do 
      get :index, user_id: user.id
      expect(response).to render_template :index
    end

  end

  describe 'GET#new' do 

    it "assigns a new ride to @ride" do 
      get :new, user_id: user.id
      expect(assigns(:ride)).to be_a_new(Ride)
    end

    it "renders the :new template" do 
      get :new, user_id: user.id
      expect(response).to render_template :new
    end

  end

  describe 'POST#Create' do 
    let!(:user) { create(:user) }

    it "saves the ride to the database" do 
      expect{
        post :create, user_id: user.id, ride: attributes_for(:ride)
      }.to change(Ride, :count).by(1)
    end

    it "redirects to :show template" do 
      post :create, user_id: user.id, ride: attributes_for(:ride)
      expect(response).to redirect_to my_ride_path(Ride.first)
    end

  end

  describe 'PATCH#Update' do 
    let!(:user) { create(:user) }
    let!(:ride) { create(:ride) }

    it "updates ride attributes" do 
      patch :update, id: ride, user_id: user.id, ride: FactoryGirl.attributes_for(:ride, donation_amt: 100)
      ride.reload
      expect(ride.donation_amt).to eq(100)
    end

    it "redirects to :show template" do 
      patch :update, id: ride, user_id: user.id, ride: FactoryGirl.attributes_for(:ride)
      expect(response).to redirect_to my_ride_path(user, Ride.first)
    end

  end

  describe 'DELETE#Destroy' do 
    let!(:user) { create(:user) }
    let!(:ride) { create(:ride) }

    it "deletes the ride" do 
      expect{ delete :destroy, id: ride, user_id: user.id }.to change(Ride, :count).by(-1) 
    end

    it "redirects to :index template" do 
      delete :destroy, id: ride, user_id: user.id
      expect(response).to redirect_to my_rides_path      
    end

  end

end