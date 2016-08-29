class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy
    
    def create
       @post = Post.find(params[:post_id])      
	       unless user_signed_in?
	         flash[:notice] = "you must log_in to comment for the post"
	         redirect_to new_user_session_path
	      	 else
		       	@comment = @post.comments.create(comment_params)
		        @comment.user_id = current_user.id

		        @comment.save
		        redirect_to post_path(@post)
      	    end
    end
        
    
    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      
      redirect_to post_path(@post)
    end
    
    private
      
    def comment_params
      params.require(:comment).permit(:name, :body)
    end
    
    def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
      if @comment.nil?
        flash[:alert] = "Not your comment!"
        redirect_to :back
      end
    end
    

end