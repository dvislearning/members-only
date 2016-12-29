module SessionsHelper

  # Logs in user, assigns fresh token, updates table with fresh token, and assigns
  # remember token cookie
  def log_in(user)
    fresh_token = User.new_remember_token
    cookies.permanent[:remember_token] = fresh_token 
    user.update_attribute(:remember_token, User.digest(fresh_token))
    @current_user = user
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

  # Logs current user out of session
  def log_out
    @current_user = nil  	
    cookies.delete(:remember_token)
  end

  # Checks if #current_user returns false
  def logged_in?
  	!current_user.nil?
  end
end
