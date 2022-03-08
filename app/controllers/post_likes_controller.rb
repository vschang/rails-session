class PostLikesController < ApplicationController
  def create
    @post_like = PostLike.new
    @post = Post.find(params[:post_id])
    user = current_user
    liked_post = PostLike.find_by(post_id: @post.id, user_id: user.id)
    if liked_post
      liked_post.destroy
      redirect_to post_path(@post)
    else
      @post_like.user = user
      @post_like.post = @post
      redirect_to post_path(@post) if @post_like.save!
    end
  end

  private

  def post_like_params
    params.require(:post_like).permit(:user_id, :post_id)
  end
end
