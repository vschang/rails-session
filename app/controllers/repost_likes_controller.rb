class RepostLikesController < ApplicationController
  def create
    @repost_like = RepostLike.new
    @repost = Repost.find(params[:repost_id])
    user = current_user
    liked_repost = RepostLike.find_by(repost_id: @repost.id, user_id: user.id)

    if liked_repost
      liked_repost.destroy
      redirect_to repost_path(@repost)
    else
      @repost_like.user = user
      @repost_like.repost = @repost
      @repost_like.save
      redirect_to repost_path(@repost) if @repost_like.save!
    end

  end


  private

  def repost_like_params
    params.require(:repost_like).permit(:user_id, :post_id)
  end
end
