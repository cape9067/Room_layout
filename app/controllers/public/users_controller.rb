class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :post]

  def show
    @user = User.find(params[:id])
    @latest_rooms = @user.rooms.order(created_at: :desc).limit(3)
    @lastest_bookmark = @user.bookmarked_rooms.order(created_at: :desc).limit(3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報がアップデートされました！"
      redirect_to public_user_path(@user)
    else
      flash.now[:danger] = "ユーザー情報の更新に失敗しました。"
      render :edit
    end
  end

  def post
    @user = User.find(params[:id])
    @rooms = @user.rooms.order(created_at: :desc).page(params[:page]).per(6)
  end


  private
    def user_params
      params.require(:user).permit(:name, :profile_image)
    end

    def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to public_user_path(current_user) , notice: "会員限定の機能です"
    end
    end
end
