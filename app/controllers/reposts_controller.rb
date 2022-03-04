class RepostsController < ApplicationController
  before_action :set_post
  before_action :get_user

  def get_user
    @username = current_user.username
    @user_now = RSpotify::User.find(current_user.uid)
    @full_name = @user_now.display_name
    @all_playlists = @user_now.playlists
    @prof_pic_url = @user_now.images[0]["url"]
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @repost = Repost.new

    @repost.user = @user
    @repost.post = @post
    if @repost.save
      redirect_to posts_path, notice: "Reposted!"
    else
      render "posts/show", alert: "Not reposted!"
    end
  end

  def destroy
    @repost = Repost.find(params[:id])

    @repost.destroy
    redirect_to posts_path
  end

  def show
    @repost = Repost.find(params[:id])
  end
  private

  def set_post  #Identify the post that pressed the repost button
    @post = Post.find(params[:post_id])
  end
end
