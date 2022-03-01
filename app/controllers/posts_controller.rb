class PostsController < ApplicationController
  def index
    # authorize @post
  end

  def show
    # authorize @post
  end

  def new
    @post = Post.new
    # authorize @post
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    # authorize @post

    @post.user = @user
    if @post.save
      redirect_to post_path(@post), notice: "Posted!"
    else
      render :new, alert: "Not posted!"
    end
  end

  def edit
    @post = Post.find(params[:id])
    # authorize @post
  end

  def update
    @post = Post.find(params[:id])
    # authorize @post
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    # authorize @post

    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
