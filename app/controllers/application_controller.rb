class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper
	
  helper_method :logged_in?, :current_user


  # Checks if #current_user returns false
  def logged_in?
    !current_user.nil?
  end

   # Retrieves current user from db when remember cookie matches remember_token
  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # Sets current user
  def current_user=(user)
    @current_user = user
  end        
end
