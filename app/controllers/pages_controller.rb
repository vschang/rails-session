class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :get_user

  def home
  end

  def search
    if params[:query].present?
      sql_query = " \
        users.first_name ILIKE :query \
        OR users.last_name ILIKE :query \
        OR users.username ILIKE :query \
      "
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = []
    end
  end

  def profile
    @user = current_user
    @user_id_arr = []
    @user_id = @user.id
    @user_id_arr << @user_id

    @user_posts = Post.where(user_id: @user_id)
    @user_reposts = Repost.where(user_id: @user_id)

    @profile_posts = @user_posts + @user_reposts
    @profile_posts = @profile_posts.sort_by{ |posts| posts.created_at }.reverse

    @post_time = []
    time_now = Time.now
    @profile_posts.each do |post|
      time_diff = time_now - post.created_at
      if time_diff < 60.0
        @post_time << "now"
      elsif time_diff < 3600.0
        @post_time << "#{(time_diff/1.minute).to_i.round}m"
      elsif time_diff > 3600.0 && time_diff < 86400.0
        @post_time << "#{(time_diff/1.hour).to_i.round}h"
      elsif time_diff > 86400.0 && time_diff < 604800.0
        @post_time << "#{(time_diff / 1.day).to_i.round}d"
      else
        @post_time << "#{(time_diff / 1.week).to_i.round}w"
      end
    end
  end

  def destroy_sesh
    sign_out_and_redirect(current_user)
  end

  def get_user
    if user_signed_in?
    @user_now = RSpotify::User.find(current_user.uid)
      @username = current_user.username
      if @user_now != nil
        @full_name = @user_now.display_name
        @all_playlists = @user_now.playlists
        @prof_pic_url = @user_now.images[0]["url"]
      end
    end
  end
end
