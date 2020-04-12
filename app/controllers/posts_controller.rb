class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy]
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.limit(10).includes(:photos, :user).order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "投稿しました！"
    else
      render :new
    end
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = "投稿を削除しました" if @post.destroy
    else
      flash[:alert] = "投稿を削除できませんでした"
    end
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :discription, photos_attributes: [:post_image]).
        merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end

end
