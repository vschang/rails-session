class RepostLikesController < ApplicationController
  def create
    @repost_like = RepostLike.new
    @repost_like.post = Repost.find(params[:repost_id])
    @repost_like.user = current_user
    @repost_like.post = @repost
  end

  def destroy
    @repost_like = ReostLike.find(params[:id])
    @repost_like.destroy
    # change the path
    redirect_to posts_path
  end

  private

  def repost_like_params
    params.require(:repost_like).permit(:user_id, :post_id)
  end
end
