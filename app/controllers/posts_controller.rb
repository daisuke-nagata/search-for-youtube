class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save@post
      flash[:success] = '動画 が正常に投稿されました'
      redirect_to posts_path
    else
      flash.now[:danger] = '動画 が投稿されませんでした'
      render :new
    end
  end
  
    def destroy
      @post.destroy
      flash[:success] = '動画を削除しました。'
      redirect_back(fallback_location: root_path)
    end

  private
  def post_params
    params.require(:post).permit(:youtuber_name, :url)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to_root_url
    end
  end
end