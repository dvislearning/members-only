class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(user_params)
		@post.name = @current_user.name
		@post.user_id = @current_user.id
		if @post.save
			flash[:success] = "Post created successfully"
			redirect_to posts_path
		else
			flash.now[:danger] = 'Post failed to save'
			render :new
		end
	end

	def index
		@posts = Post.all
	end

	private

	def user_params
		params.require(:post).permit(:subject,:body, :name)
	end

    # Redirects to login_url if not logged in
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end	
end
