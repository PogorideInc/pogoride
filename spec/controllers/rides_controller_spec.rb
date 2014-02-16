
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

end
 