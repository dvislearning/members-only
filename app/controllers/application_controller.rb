class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

	def log_in(user)
		fresh_token = user.new_remember_token
		user.update_attribute(:remember_token, fresh_token)
		cookies.permanent[:remember_token] = fresh_token
		current_user
	end

	def current_user
		@current_user ||= User.find_by(remember_token: cookies[:remember_token])
	end

	def current_user=(user)
		@current_user = user
	end

	def log_out
		cookies.delete(:remember_token)
		@current_user = nil
	end
end
