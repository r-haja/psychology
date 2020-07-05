class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy]
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = current_user.posts.includes(:photos).order("created_at DESC").
              page(params[:page]).per(15)
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "投稿しました！"
    else
      flash[:alert] = "入力誤りがあります。再度記入してください。"
      @posts = Post.includes(:photos, :user).order("created_at DESC").
                page(params[:page]).per(15)
      render :index
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
