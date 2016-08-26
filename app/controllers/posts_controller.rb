class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :correct_user,       only: [:destroy, :edit]


	def search
		if params[:search].present?
			@posts = Post.search(params[:search])
		else
			@posts = Post.all
		end	
	end

	def index
		@posts = Post.all.order('created_at DESC')		
	end

	def new	
		@post = Post.new	
	end

	def create
		@post = Post.new(post_params)

		if @post.save	
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])		
	end

	def edit
		@post = Post.find(params[:id])		
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :date, :time, :location))
			redirect_to @post
		else
			render 'edit'
		end	
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path		
	end

	def upvote
	  @post = Post.find(params[:id])
	  @post.upvote_by current_user
	  redirect_to :back
	end


	private
	def post_params
		params.require(:post).permit(:title, :date, :time, :location)
	end

	def correct_user
        @post = current_user.posts.find_by(id: params[:id])
        if @post.nil?
          flash[:alert] = "Not your post!"
          redirect_to :back
        end
    end
end
