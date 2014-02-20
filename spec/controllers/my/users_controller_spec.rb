require 'spec_helper'

describe My::UsersController do

  describe "GET #show" do
    before :each do
      @user1 = create(:user)
      session[:user_id] = @user1.id
    end

    it "assign the requested user to @user" do
      get :show, id: @user1
      expect(assigns(:user)).to eq(@user1)
    end

    it "renders the :show template" do
      get :show, id: @user1
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    before :each do
      @user1 = create(:user)
      session[:user_id] = @user1.id
    end

    it "assigns the requested community to @user" do
      get :edit, id: @user1
      expect(assigns(:user)).to eq(@user1)
    end

    it "renders the :edit template" do
      get :edit, id: @user1
      expect(response).to render_template :edit
    end
  end 

  describe "PATCH #update" do
    before :each do
      @user1 = create(:user, username: "user", email: "user@exmaple.com")
      session[:user_id] = @user1.id
    end

    context "valid attributes" do

      it "located the requested @user" do
        patch :update, id: @user1, user: attributes_for(:user)
        expect(assigns(:user)).to eq @user1
      end

      it "changes @user's attributes" do
        patch :update, id: @user1, 
          user: attributes_for(:user, username: "Should", email: "equal@exmaple.com")
        @user1.reload
        expect(@user1.username).to eq "Should"
        expect(@user1.email).to eq "equal@exmaple.com"
      end

      it "redirects to the updated user" do
        patch :update, id: @user1, user: attributes_for(:user)
        expect(response).to redirect_to @user1
      end
    end

    context "with invlid attributes" do
      
      it "does not change the contact's attributes" do
        patch :update, id: @user1, user: attributes_for(:invalid_user)
        @user1.reload
        expect(@user1.username).to eq "user"
        expect(@user1.email).to eq "user@exmaple.com"
      end

      it "renders the edit template" do
        patch :update, id: @user1, user: attributes_for(:invalid_user)
        expect(response).to render_template :edit
      end

    end 
  end
end
