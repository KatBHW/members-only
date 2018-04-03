class PostsController < ApplicationController

	before_action :require_signin, only: [:new, :create]
	 
  def new
  	@post = Post.new
  end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
		else
			render new_post_path
		end
	end

  def index
  	@posts = Post.all
  end
  
  private 
  	def post_params
  		params.require(:post).permit(:title, :body)
  	end
  
end
