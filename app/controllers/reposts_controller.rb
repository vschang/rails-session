class RepostsController < ApplicationController
  before_action :set_post

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @repost = Repost.new

    @repost.user = @user
    @repost.post = @post
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

  def set_post  #Identify the post that pressed the repost button
    @post = Post.find(params[:post_id])
  end
end
