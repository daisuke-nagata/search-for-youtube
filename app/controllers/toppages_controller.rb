class ToppagesController < ApplicationController
  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result 
  end
end
