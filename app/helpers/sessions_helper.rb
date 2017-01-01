module SessionsHelper

  # Logs in user, assigns fresh token, updates table with fresh token, and assigns
  # remember token cookie
  def log_in(user)
    fresh_token = User.new_remember_token
    cookies.permanent[:remember_token] = fresh_token 
    user.update_attribute(:remember_token, User.digest(fresh_token))
    @current_user = user
  end 

  # Logs current user out of session
  def log_out
    @current_user = nil  	
    cookies.delete(:remember_token)
  end 
end
