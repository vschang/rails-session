class RepostCommentsController < ApplicationController
  def create
    @repost = Repost.find(params[:repost_id])
    @repost_comment = RepostComment.new(repost_comment_params)
    @repost_comment.repost = @repost
    @repost_comment.user = current_user
    if @repost_comment.save
      redirect_to repost_path(@repost), notice: 'Commented!'
    else
      render 'repost/show', alert: 'Unable to comment.'
    end
  end

  private

  def repost_comment_params
    params.require(:repost_comment).permit(:content, :user_id, :repost_id)
  end
end
