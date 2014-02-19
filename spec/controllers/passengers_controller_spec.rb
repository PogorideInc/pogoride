require 'spec_helper'

describe PassengersController do
  before :each do
    @ride = create(:ride)
    @user = create(:user)
    @pass = create(:passenger)
    session[:user_id] = @user.id
  end

  describe "GET 'index'" do
    it "assigns pertinent ride to @ride" do
      get :index, {ride_id: @ride.id, :params => {:ride_id => @ride.id }}
      expect(assigns(:ride)).to eq @ride
    end
    it "assigns all passengers associated with the ride to @passengers" do
      @ride.passengers << @pass
      @ride.save
      get :index, {ride_id: @ride.id, :params => {:ride_id => @ride.id }}
      expect(assigns(:passengers)).to match_array([@ride.passengers.first])
    end
    it "renders the :index view" do
      get :index, {ride_id: @ride.id, :params => {:ride_id => @ride.id }}
      expect(response).to render_template :index
    end
  end

  describe "GET 'show'" do
    it "assigns pertinent ride to @ride" do
      get :show, {id: @pass.id, ride_id: @ride.id, :params => {:ride_id => @ride.id }}
      expect(assigns(:ride)).to eq @ride
    end
    it "assigns the requested passenger to @passenger" do
      @ride.passengers << @pass
      get :show, {id: @pass.id, ride_id: @ride.id, :params => {:ride_id => @ride.id }}
      expect(assigns(:passenger)).to eq @pass
    end
    it "renders the :show view" do
      get :show, {id: @pass.id, ride_id: @ride.id, :params => {:ride_id => @ride.id }}
      expect(response).to render_template :show
    end
  end

  describe "handles POST 'create'" do

    context "with valid attributes and" do
      it "assigns the pertinent ride to @ride when given id from form" do
        post :create, {id: @pass.id, ride_id: @ride.id, :ride_id_from_form_for => @ride.id }
        expect(assigns(:ride)).to eq @ride
      end
      it "creates a new passenger with @ride.id and current_user and saves." do
        expect{
          post :create, {id: @pass.id, ride_id: @ride.id, :message_text => "message_text" , ride_id_from_form_for: @ride.id }
        }.to change(Passenger, :count).by(1)
      end
      it "creates a new message as found in params[:message_text] and saves" do
        expect{
          post :create, {id: @pass.id, ride_id: @ride.id, :message_text => "message_text" , ride_id_from_form_for: @ride.id }
        }.to change(Message, :count).by(1)
      end
      it "redirects to the path for the relevent ride." do
        post :create, {id: @pass.id, ride_id: @ride.id, :message_text => "message_text" , ride_id_from_form_for: @ride.id }
        expect(response).to redirect_to my_ride_path(@user, @ride)
      end
    end

    context "and with invalid attributes, " do
      it "doesn't create a new message without :message_text" do
        expect{
          post :create, {id: @pass.id, ride_id: @ride.id, ride_id_from_form_for: @ride.id }
        }.to_not change(Message, :count).by(1)
      end
      it "doesn't save the passenger if there's no message entered" do
        expect{
          post :create, {id: @pass.id, ride_id: @ride.id, ride_id_from_form_for: @ride.id }
          }.to_not change(Passenger, :count)
      end
      it "redirects back to the public index of availble rides." do
        post :create, {id: @pass.id, ride_id: @ride.id, ride_id_from_form_for: @ride.id }
        expect(response).to redirect_to rides_path
      end
    end

  end

end
