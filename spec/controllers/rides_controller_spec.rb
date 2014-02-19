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

end
 