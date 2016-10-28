class CommentsController < ApplicationController
  before_action :require_user, only: [:destroy]
  def create
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Comment was successfully created!'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    post = Post.find params[:post_id]
    comment = Comment.find params[:id]
    comment.destroy
    flash[:danger] = 'Comment was successfully deleted!'
    redirect_to post_path(post)
  end
end
