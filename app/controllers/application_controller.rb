class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def if_not_user_redirect
  	if current_user
    	unless current_user.id
    	  redirect_to root_path, notice: "You need to sign up to access these features."
    	end
    else 
    	redirect_to root_path
    end
  end

end
