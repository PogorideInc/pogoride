require 'spec_helper'


describe RidesController do
  let!(:user) { create(:user) }

  before :each do
    session[:user_id] = user.id
  end

  describe'GET#show' do
    let!(:ride) { create(:ride) }

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

  describe 'GET#requests' do 

    it "assigns all rides with no driver to @rides" do
      rides = create(:ride, driver_id: nil)
      get :requests, user_id: user.id
      expect(assigns(:rides)).to match_array([rides])
    end

    it "renders the :requests template" do 
      get :requests, user_id: user.id
      expect(response).to render_template :requests
    end

  end

  describe 'GET#drives' do 

    it "assigns all rides with a driver to @rides" do
      rides = create(:ride)
      get :drives, user_id: user.id
      expect(assigns(:rides)).to match_array([rides])
    end

    it "renders the :drives template" do 
      get :drives, user_id: user.id
      expect(response).to render_template :drives
    end

  end

end
 