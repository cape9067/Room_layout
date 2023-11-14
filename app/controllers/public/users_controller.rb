class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @latest_rooms = Room.order(created_at: :desc).limit(4)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @room.update(user_params)
      flash[:success] = "ユーザー情報がアップデートされました！"
      redirect_to public_user_path(@user)
    else
      flash.now[:danger] = "ユーザー情報の更新に失敗しました。"
      render :edit
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
    def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to public_user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
    end  
end
