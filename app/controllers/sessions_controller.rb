class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
      "You are logged in"
  	else
  		flash.now[:danger] = 'Invalid Email and/or password'
  		render 'new'
  	end
  end

  def delete
    log_out
  end
end
