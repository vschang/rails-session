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
    # @posts = Post.all
    # @reposts = Repost.all
    # raise
    combined_arr = Post.all + Repost.all
    @combined_posts = combined_arr.sort_by{ |combined_post| combined_post.created_at }.reverse

    # Post.where(user: current_user)
    # Repost.where(user: current_user)
    # Friendships.where(requester: current_user)
    # Friendships.where(receiver: current_user)
  end

  def show
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
      redirect_to post_path(@post), notice: "Posted!"
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
    params.permit(:title, :content)
  end
end
