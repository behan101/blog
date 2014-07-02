class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  # GET /posts.atom
	def index
		@posts = Post.all

		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.atom
		end
	end

	def show
		@post = Post.find(params[:id])

	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to posts_path, :notice => "Your post has been saved"
		else
			render "new"
		end
	end

  def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to posts_path, :notice => "Your post has been updated"
		else
			render "edit"
		end
	end

	def destroy
			@post = Post.find(params[:id])
			@post.destroy
			redirect_to posts_path, :notice => "Your post has been deleted"
	end

	private
	def post_params
		params.require(:post).permit!
	end
end

def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment])
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end
