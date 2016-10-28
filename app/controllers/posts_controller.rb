class PostsController < ApplicationController
POSTS_PER_PAGE = 5
before_action :find_post, only: [:edit, :update, :destroy, :show]

before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      flash[:success] = 'Post was successfully created!'
      redirect_to post_path(@post)
    else
      # flash.now[:alert] = 'Please see the errors below'
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: POSTS_PER_PAGE)
    else
      @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: POSTS_PER_PAGE)
    #.page(params[:page]).per(POSTS_PER_PAGE)
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:success] = 'Post was successfully updated!'
      redirect_to post_path(@post)
    else
      # flash.now[:alert] = 'Please see the errors below'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:danger] = 'Post was successfully deleted!'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def require_same_user
    if current_user != @post.user
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end

end
