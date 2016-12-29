class PostsController < ApplicationController
	before_action :logged_in_user?, only: [:new, :create]

	def new
		#stuff
	end

	def create
		#even more stuff
	end

	def index
		#alas, more stuff
	end

	private

	def logged_in_user?
		logged_in?
	end
end
