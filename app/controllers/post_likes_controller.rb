class PostLikesController < ApplicationController
  def create
    @post_like = PostLike.new
    @post_like.post = Post.find(params[:post_id])
    @post_like.user = current_user
    @post_like.post = @post
  end

  def destroy
    @post_like = PostLike.find(params[:id])
    @post_like.destroy
    # change the path
    redirect_to posts_path
  end

  private

  def post_like_params
    params.require(:post_like).permit(:user_id, :post_id)
  end
end
