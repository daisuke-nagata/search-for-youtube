class UsersController < ApplicationController
  
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @post = current_user.posts.build
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
end

 private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end