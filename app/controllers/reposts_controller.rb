class RepostsController < ApplicationController
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
    found_post = Repost.all.find_by(user: current_user, post: @post)
    if found_post
      redirect_to posts_path, notice: "You cannot repost twice!"
    else
      @repost.user = @user
      @repost.post = @post
      if @repost.save
        redirect_to posts_path, notice: "Reposted!"
      else
        render "posts/show", alert: "Not reposted!"
      end
    end
  end

  def destroy
    @repost = Repost.find(params[:id])

    @repost.destroy
    redirect_to posts_path
  end

  def show
    @user = current_user
    @repost = Repost.find(params[:id])
    @repost_comment = RepostComment.new
    @repost_like = RepostLike.new
    @repost_comments = RepostComment.where(repost: @repost).sort_by { |comment| comment.created_at }.reverse!

    @repost_comment_time = []
    time_now = Time.now
    @repost_comments.each do |comment|
      time_diff = time_now - comment.created_at
      if time_diff < 60.0
        @repost_comment_time << "now"
      elsif time_diff < 3600.0
        @repost_comment_time << "#{(time_diff / 1.minute).to_i.round}m"
      elsif time_diff > 3600.0 && time_diff < 86400.0
        @repost_comment_time << "#{(time_diff / 1.hour).to_i.round}h"
      elsif time_diff > 86400.0 && time_diff < 604800.0
        @repost_comment_time << "#{(time_diff / 1.day).to_i.round}d"
      else
        @repost_comment_time << "#{(time_diff / 1.week).to_i.round}w"
      end
    end
  end

  private

end
