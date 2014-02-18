require 'spec_helper'

describe SessionsController do

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "creates a value user_id in session" do 
      usr1 = create(:user, email: "user@exmaple.com", password: "password", password_confirmation: "password")
      get :create, email: usr1.email, password: usr1.password
      expect(session[:user_id]).to eq usr1.id
    end
  end

  describe "DELETE #destroy" do
    
    it "destroys the user_id in the session and redirect_to the new session path" do
      usr1 = create(:user)
      session[:user_id] = usr1.id 
      delete :destroy, id: usr1.id
      expect(session[:user_id]).to eq nil
      expect(response).to redirect_to new_session_path
    end
  end
end