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
    @posts = Post.all
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
    params.require(:post).permit(:title, :content)
  end
end
