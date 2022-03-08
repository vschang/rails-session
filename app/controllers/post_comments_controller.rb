class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post = @post
    @post_comment.user = current_user
    if @post_comment.save
      redirect_to post_path(@post), notice: 'Commented!'
    else
      render 'post/show', alert: 'Unable to comment.'
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])

    @post_comment.destroy
    # change the path 
    redirect_to posts_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :user_id, :post_id)
  end
end
