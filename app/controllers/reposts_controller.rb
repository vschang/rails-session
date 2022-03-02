class RepostsController < ApplicationController
  def index
    @repost = Repost.all
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @repost = Repost.new(repost_params)

    @repost.user = @user
    @post.repost = @repost

    if @repost.save
      redirect_to post_path(@post), notice: "Reposted!"
    else
      render "posts/show", alert: "Not reposted!"
    end
  end

  def destroy
    @repost = Repost.find(params[:id])

    @repost.destroy
    redirect_to posts_path
  end

  private

  def repost_params
    params.require(:repost).permit(:user_id, :post_id)
  end
end
