class PostsController < ApplicationController
  before_action :get_user
  def get_user
    @username = current_user.username
    @user_now = RSpotify::User.find(current_user.uid)
    @full_name = @user_now.display_name
    @all_playlists = @user_now.playlists
    @prof_pic_url = @user_now.images[0]["url"]
  end

  def index
    @user = current_user
    @user_id_arr = []
    @user_id = @user.id
    @user_id_arr << @user_id

    @friends = (Friendship.all.where(status: "accepted").where(requester_id: @user.id).or(Friendship.all.where(status: "accepted").where(receiver_id: @user.id)))

    @receiving_friends_id = @friends.map(&:receiver_id)
    @requesting_friends_id = @friends.map(&:requester_id)
    @everyone_id = (@user_id_arr + @receiving_friends_id + @requesting_friends_id).uniq

    @all_posts = Post.where(user_id: @everyone_id)
    @all_reposts = Repost.where(user_id: @everyone_id)

    @feed_posts = @all_posts + @all_reposts
    @feed_posts = @feed_posts.sort_by{ |posts| posts.created_at }.reverse

    @post_time = []
    time_now = Time.now
    @feed_posts.each do |post|
      time_diff = time_now - post.created_at
      puts time_diff
      if time_diff < 3600.0
        puts "less than 3600.0"
        x = (time_diff/1.minute).to_i.round
        if x >= 1.5
          @post_time << "#{(time_diff/1.minute).to_i.round} minutes"
          puts "pushed to post time"
        else
          @post_time << "#{(time_diff/1.minute).to_i.round} minute"
        end
      elsif time_diff > 3600.0 && time_diff < 86400.0
        x = (time_diff/1.hour).to_i.round
        if x >= 1.5
          @post_time << "#{(time_diff/1.hour).to_i.round} hours"
        else
          @post_time << "#{(time_diff/1.hour).to_i.round} hour"
        end
      else
        x = (time_diff/1.day).to_i.round
        if x >= 1.5
          @post_time << "#{(time_diff/1.day).to_i.round} days"
        else
          @post_time << "#{(time_diff/1.day).to_i.round} day"
        end
      end
    end
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)

    @post.user = @user
    if @post.save
      redirect_to posts_path(@post), notice: "Posted!"
    else
      render :new, alert: "Not posted!"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
